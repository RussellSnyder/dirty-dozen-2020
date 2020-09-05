import 'package:dirty_dozen/data/foods.dart';
import 'package:dirty_dozen/models/Food.dart';
import 'package:dirty_dozen/screens/CleanFoodsScreen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  static int questionIndex = 0;
  static List<Food> foods = [...dirtyFoods, ...cleanFoods];
  Food currentQuestion = foods.elementAt(0);
  bool isComplete = false;

  _QuizScreenState() {
    foods.shuffle();
    currentQuestion = foods.elementAt(0);
  }

  List<Widget> scoreIcons = [];

  void reset() {
    setState(() {
      isComplete = false;
      score = 0;
      questionIndex = 0;
      currentQuestion = foods.elementAt(questionIndex);
      scoreIcons.clear();
    });
  }

  void nextQuestion() {
    if (questionIndex >= foods.length - 1) {
      isComplete = true;
    } else {
      questionIndex++;
      currentQuestion = foods.elementAt(questionIndex);
    }
  }

  void submitAnswer(FoodCategory guessedAnswer) {
    final isCorrect = currentQuestion.category == guessedAnswer;

    if (isCorrect) {
      setState(() {
        score++;
        scoreIcons.add(Icon(Icons.check, color: Colors.green));
        nextQuestion();
      });
    }

    if (!isCorrect) {
      Alert(
        context: context,
        type: AlertType.error,
        title:
            "${currentQuestion.name} ${(currentQuestion.isPlural ? "are" : "is")} ${(currentQuestion.category == FoodCategory.clean ? "clean" : "dirty")}",
        desc:
            "You guessed ${(guessedAnswer == FoodCategory.clean ? "clean" : "dirty")}",
        buttons: [
          DialogButton(
            child: Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                nextQuestion();
                scoreIcons.add(Icon(Icons.close, color: Colors.red));
              });
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool answeredAllCorrectly = isComplete && (score == foods.length);

    return Scaffold(
      appBar: AppBar(
        title: Text(isComplete
            ? 'Done!'
            : 'Question ${questionIndex + 1} of ${foods.length}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: isComplete
              ? <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: Text(
                        'You got $score of ${foods.length} correct',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
                    child: Center(
                      child: Text(
                        '${(answeredAllCorrectly ? "Great job!" : "Study more to get better")}',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    color: Colors.red,
                    child: Text(
                      'Close Quiz',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      reset();
                      Navigator.pop(context);
                    },
                  ),
                ]
              : <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                    child: Center(
                      child: Text(
                        currentQuestion.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(
                        'assets/food_images/' + currentQuestion.image),
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          color: Colors.red,
                          child: Text(
                            'Dirty',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            submitAnswer(FoodCategory.dirty);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          textColor: Colors.white,
                          color: Colors.green,
                          child: Text(
                            'Clean',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            submitAnswer(FoodCategory.clean);
                          },
                        ),
                      ),
                    ),
                  ]),
                  Wrap(
                    children: scoreIcons,
                  ),
                ],
        ),
      ),
    );
  }
}
