import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

QuizBrain qb = QuizBrain();
void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FLUTTER QUIZ'),
          backgroundColor: Colors.redAccent[200],
          centerTitle: true,
          elevation: 0.0,
        ),
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: OopsConcept(),
          ),
        ),
      ),
    );
  }
}

class OopsConcept extends StatefulWidget {
  @override
  _OopsConceptState createState() => _OopsConceptState();
}

class _OopsConceptState extends State<OopsConcept> {
  List<Widget> score = [];
  int totals = 0;

  void check(bool yourAnswer) {
    bool correctAns = qb.getAnswer();
    setState(() {
      if (qb.isFinished() == false) {
        if (yourAnswer == correctAns) {
          totals = totals + 1;
          score.add(
            Icon(Icons.check, color: Colors.lightGreen),
          );
        } else {
          score.add(
            Icon(Icons.close, color: Colors.redAccent),
          );
        }
      }
      else{
        Alert(context: context, title: "Done $totals",desc: "Quiz Ended",).show();
        qb.reset();score=[];totals=0;
      }
      qb.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.blueAccent,
              child: Text(
                "True",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () {
                check(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "False",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () {
                check(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}