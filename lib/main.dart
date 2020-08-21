import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './models/Food.dart';
import './data/foods.dart';

class ScreenDetails {
  // ignore: missing_return
  String routeName() {}
  // ignore: missing_return
  String title() {}
  // ignore: missing_return
  String navbarLabel() {}
  // ignore: missing_return
  IconData icon() {}
  // ignore: missing_return
  MaterialColor color() {}
}

const languages = [
  'English',
  'German',
  'Spanish',
];

abstract class Screen extends StatelessWidget implements ScreenDetails {}

class FoodGridList extends StatelessWidget {
  FoodGridList(this.foods, this.category);

  final List<Food> foods;
  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ...foods.map((Food food) => GridTile(
                footer: Material(
                  color: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(food.name),
                    // subtitle: _GridTitleText(photo.subtitle),
                  ),
                ),
                child: Hero(
                  tag: food.id,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        FoodDetailsPage.routeName,
                        arguments: FoodDetailsPageArguments(food),
                      ),
                      child: Image.asset(
                        'assets/food_images/' + food.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )),
        ]);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  String _selectedLanguage = languages[0];

  PageController _pageController = PageController(
    initialPage: 0,
  );

  final List<Screen> _mainScreens = [
    DirtyFoodsPage(),
    CleanFoodsPage(),
    QuizPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EWG’s 2020 Shoppers\'s Guide to Pesticides in Produce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_mainScreens[_selectedIndex].title()),
          backgroundColor: _mainScreens[_selectedIndex].color(),
          actions: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            )
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.language),
                  Expanded(child: 
                    Text('Language', style: TextStyle(fontSize: 20))
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        value: _selectedLanguage,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedLanguage = newValue;
                          });
                        },
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(fontSize: 20)),
                          );
                        }).toList()),
                  ),
                ],
              )
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: _mainScreens,
          onPageChanged: (index) => {
            setState(() {
              _selectedIndex = index;
            })
          },
          // physics: BouncingScrollPhysics(),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar`
              primaryColor: Colors.blueAccent,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: Colors.grey))), // sets the inactive color of the
          child: new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: _mainScreens.map((screen) {
                final isActive = _mainScreens.indexOf(screen) == _selectedIndex;

                return new BottomNavigationBarItem(
                  activeIcon: Icon(
                    screen.icon(),
                    color: screen.color(),
                  ),
                  icon: Icon(
                    screen.icon(),
                    color: Colors.grey[500],
                  ),
                  title: Text(screen.navbarLabel(),
                      style: TextStyle(
                        color: isActive ? screen.color() : Colors.grey[600],
                      )),
                );
              }).toList(),
              currentIndex: _selectedIndex,
              fixedColor: Colors.deepPurple,
              onTap: (int index) => {
                    _pageController.animateToPage(index,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 400))
                  }),
        ),
      ),
      routes: {
        FoodDetailsPage.routeName: (context) => FoodDetailsPage(),
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class DirtyFoodsPage extends Screen {
  MaterialColor color() => Colors.red;
  IconData icon() => Icons.warning;
  String routeName() => 'dirty';
  String title() => 'Dirty Dozen';
  String navbarLabel() => 'Dirty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodGridList(dirtyFoods, FoodCategory.dirty));
  }
}

class AboutPage extends Screen {
  MaterialColor color() => Colors.brown;
  IconData icon() => Icons.info_outline;
  String routeName() => 'about';
  String title() => 'What is this about?';
  String navbarLabel() => 'Info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('about'));
  }
}

class QuizPage extends Screen {
  MaterialColor color() => Colors.blue;
  IconData icon() => Icons.school;
  String routeName() => 'quiz';
  String title() => 'Pesticides Quiz';
  String navbarLabel() => 'Quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Quiz'));
  }
}

class CleanFoodsPage extends Screen {
  MaterialColor color() => Colors.green;
  IconData icon() => Icons.thumb_up;
  String routeName() => 'clean';
  String title() => 'Clean Fifteen';
  String navbarLabel() => 'Clean';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodGridList(cleanFoods, FoodCategory.dirty));
  }
}

class FoodDetailsPageArguments {
  final Food food;

  FoodDetailsPageArguments(this.food);
}

class FoodDetailsPage extends StatelessWidget {
  static const routeName = '/food_details';

  @override
  Widget build(BuildContext context) {
    final FoodDetailsPageArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(args.food.name),
          backgroundColor: args.food.category == FoodCategory.dirty
              ? Colors.red
              : Colors.green),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
                tag: args.food.id,
                child: Image(
                    image:
                        AssetImage('assets/food_images/' + args.food.image))),
            Text(
              args.food.name + ' is delicious',
            ),
          ],
        ),
      ),
    );
  }
}
