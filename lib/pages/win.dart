import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'attack.dart';

class WinScreen extends StatelessWidget{
  
  @override 
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('YOU WON!', textScaleFactor: 4, 
              style: GoogleFonts.spaceMono(
                textStyle: TextStyle(color: Colors.red, letterSpacing: .8),
              ),
            ),

            SizedBox(
                  width: 300, // <-- Your width
                  height: 50, // <-- Your height
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/Defense');
                  }, 
                  child: Text('PLAY AGAIN', textScaleFactor: 2,
                      style: GoogleFonts.spaceMono(
                      textStyle: TextStyle(color: Colors.black, letterSpacing: .9),
                      ),
                    ),
                  ),
                ),
          ],
          ),
        ),
    );
  }
}