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
            Text('Select Game mode:', textScaleFactor: 3,
              style: GoogleFonts.spaceMono(
                textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
              ),
            ),
            SizedBox(
                  width: 200, // <-- Your width
                  height: 100, // <-- Your height
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/Attack');
                  }, 
                  child: Text('Attack', textScaleFactor: 2,
                          style: GoogleFonts.spaceMono(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
                          ),
                        ),
                  ),
                ),
            SizedBox(
                  width: 200, // <-- Your width
                  height: 100, // <-- Your height
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/Defense');
                  }, 
                  child: Text('Defense', textScaleFactor: 2,
                      style: GoogleFonts.spaceMono(
                      textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
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
