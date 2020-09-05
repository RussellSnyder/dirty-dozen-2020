import 'package:dirty_dozen/screens/InfoScreen.dart';
import 'package:dirty_dozen/screens/CleanFoodsScreen.dart';
import 'package:dirty_dozen/screens/DirtyFoodsScreen.dart';
import 'package:dirty_dozen/screens/FoodDetailsScreen.dart';
import 'package:dirty_dozen/screens/QuizScreen.dart';
import 'package:dirty_dozen/screens/QuizStartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screens/Screen.dart';

const languages = [
  'English',
  'German',
  'Spanish',
];

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
    DirtyFoodsScreen(),
    CleanFoodsScreen(),
    QuizStartScreen(),
    InfoScreen(),
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
        FoodDetailsScreen.routeName: (context) => FoodDetailsScreen(),
        QuizScreen.routeName: (context) => QuizScreen(),
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}