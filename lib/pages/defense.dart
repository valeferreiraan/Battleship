import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefenseScreen extends StatefulWidget {
  @override
  _ButtonGridState createState() => _ButtonGridState();
}

class _ButtonGridState extends State<DefenseScreen> {
  int _counterbarcos=0;

  List<List<bool>> _buttonStates = List.generate(5, (_) => List.filled(5, false));

  void _toggleButtonStateHorizontal(int row, int col) {
    setState(() {
      if (_counterbarcos<4){
        if (col != 5){
          if(!_buttonStates[row][col] && !_buttonStates[row][col+1]){
            _buttonStates[row][col] = !_buttonStates[row][col];
            _buttonStates[row][col+1] = !_buttonStates[row][col+1];
            increase_barcos();
          } else if(_buttonStates[row][col] && _buttonStates[row][col+1]){
            _buttonStates[row][col] = !_buttonStates[row][col];
            _buttonStates[row][col+1] = !_buttonStates[row][col+1];
            decrease_barcos();
          }
        }
      }
    });
  }

  void _toggleButtonStateVertical(int row, int col) {
    setState(() {
      if (_counterbarcos<4){
        if (row != 5){
          if(!_buttonStates[row][col] && !_buttonStates[row+1][col]){
            _buttonStates[row][col] = !_buttonStates[row][col];
            _buttonStates[row+1][col] = !_buttonStates[row+1][col];
            increase_barcos();
          } else if(_buttonStates[row][col] && _buttonStates[row+1][col]){
            _buttonStates[row][col] = !_buttonStates[row][col];
            _buttonStates[row+1][col] = !_buttonStates[row+1][col];
            decrease_barcos();
          }
        }
      }
    });
  }

  void _resetButtonState(){
    setState(() {
      for (int i=0; i<5; i++){
        for (int j=0; j<5; j++){
          _buttonStates[i][j] = false;
        }
      }
      _counterbarcos=0;
    });
  }

  void increase_barcos(){
    setState(() {_counterbarcos++;});
    print(_counterbarcos);
  }

  void decrease_barcos(){
    setState(() {if (_counterbarcos>0){_counterbarcos--;}});
    print(_counterbarcos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tightForFinite(width: 600),
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                  padding: EdgeInsets.only(left:60.0, bottom: 20.0, right: 60.0),
                  child: Text('LOCATE YOUR SHIPS', textScaleFactor: 2,
                    style: GoogleFonts.spaceMono(
                      textStyle: TextStyle(color: Colors.red, letterSpacing: .8),),
                    textAlign: TextAlign.center,),
                    ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0,),
                child: GridView.builder(
                  itemCount: 25,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    int row = index ~/ 5;
                    int col = index % 5;
                    return ElevatedButton(
                      //con click normal se pone el barco horizontal
                        onPressed: () {
                          _toggleButtonStateHorizontal(row, col);
                          //print(_buttonStates);
                        },
                      //con click largo se pone el barco vertical
                        onLongPress: () {
                          _toggleButtonStateVertical(row, col);
                          //print(_buttonStates);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: _buttonStates[row][col] ? Colors.green : Colors.blue),
                        child: Text(''),
                      );
                  },
                ),
              ),
            ),
            Padding(
                  padding: EdgeInsets.only(left:60.0, bottom: 20.0, right: 60.0),
                  child: Text('Press fast for horizontal ships, long press for vertical ships', 
                    style: GoogleFonts.spaceMono(
                      textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
                    ),
                    textAlign: TextAlign.center,),
                    ),
            Padding(
              padding: EdgeInsets.only(bottom:40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){_resetButtonState();}, 
                    child: Text('DELETE',
                      style: GoogleFonts.spaceMono(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: .8),
                      ),
                      ),
                    ),
                  SizedBox(width: 30.0),
                  ElevatedButton(onPressed: (){print(_buttonStates);
                            Navigator.pushNamed(context, '/Attack', arguments: _buttonStates);}, 
                            child: Text('DONE',
                                  style: GoogleFonts.spaceMono(
                                  textStyle: TextStyle(color: Colors.white, letterSpacing: .8),
                              ),
                              )
                            ),
                ],)
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Save the button states when the widget is disposed
    // For example, you can save it to a database or a file
    // Here we just print the button states to the console
    print(_buttonStates);
  }
}
