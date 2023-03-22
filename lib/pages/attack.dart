import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttackScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Attack', textScaleFactor: 3),
            
          ],
          ),
        ),
    );
  }
}