import 'package:flutter/material.dart';

class Answer extends StatelessWidget{
  var answerButtonText;
  final Function answerQuestion;
  
  Answer(this.answerButtonText, this.answerQuestion);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: RaisedButton(
        child: Text(this.answerButtonText),
        textColor: Colors.white,
        onPressed: answerQuestion,  
        ),
    );
  }
}