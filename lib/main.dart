import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;
  
  final questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answer': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s your favourite instructor?',
        'answer': ['Max', 'Ben', 'Bill', 'Mark']
      }
    ];

    
  void _answerQuestion(){
    setState(() {
    _questionIndex = _questionIndex + 1;
    });
    //print('Answer Choosen: ' + a);
  }
  
  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Scaffold dummyscaffold = Scaffold(
                                appBar: AppBar(
                                  title: Text('Quentionaire')
                                ),
                                body: _questionIndex < questions.length ?
                                  Column(
                                    children: [
                                      Text('The Question!'),
                                      Question(
                                        questions[_questionIndex]['questionText'],
                                      ),
                
                                      ...(questions[_questionIndex]['answer'] as List<String>).map((answer){
                                        return Answer(answer, _answerQuestion);
                                      }).toList()

                                      //Answer((questions[_questionIndex]['answer'] as List)[0], _answerQuestion),                                      
                                      //Answer((questions[_questionIndex]['answer'] as List)[1], _answerQuestion),                                      
                                      //Answer((questions[_questionIndex]['answer'] as List)[2], _answerQuestion),                                      
                                      //Answer((questions[_questionIndex]['answer'] as List)[3], _answerQuestion),                                      
                                    ],
                                  )
                                  : Center(
                                      child: Column(
                                        children: <Widget>[
                                          Text('Thank You', 
                                                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                          ),
                                          FlatButton(
                                            child: Text('Restart Quiz!'),
                                            textColor: Colors.blue,
                                            onPressed: _resetQuiz,
                                          )
                                        ],)

                                                                     )                                                               
                             ); 
                    
    return MaterialApp(home: dummyscaffold,);
  }
}