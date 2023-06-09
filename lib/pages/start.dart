import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('BATTLESHIP', textScaleFactor: 4, 
              style: GoogleFonts.spaceMono(
                textStyle: TextStyle(color: Colors.red, letterSpacing: .8),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 80.0),
              child: Text('Locate your ships and then attack!', textScaleFactor: 2,
              style: GoogleFonts.spaceMono(
                textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
              ),
            ),),
            

            SizedBox(
                  width: 200, // <-- Your width
                  height: 50, // <-- Your height
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/Defense');
                  }, 
                  child: Text('PLAY', textScaleFactor: 2,
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
