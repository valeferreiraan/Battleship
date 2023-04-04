import 'dart:html';

import 'package:batalla_naval/pages/win.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'defense.dart';

class AttackScreen extends StatefulWidget {
  @override
  _ButtonGridState createState() => _ButtonGridState();
}

class _ButtonGridState extends State<AttackScreen> {
  int _countertries = 0;
  int _counterhits = 0;

  List<List<bool>> _buttonStatesAttack =
      List.generate(5, (_) => List.filled(5, false));
  List<List<bool>> _buttonStatesPressed =
      List.generate(5, (_) => List.filled(5, false));
  List<List<bool>> _buttonStatesHit =
      List.generate(5, (_) => List.filled(5, false));
  bool isButtonPressed = false;

  void onPressedButton() {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  void _toggleButtonState(int row, int col) {
    setState(() {
      _buttonStatesAttack[row][col] = true;
    });
  }

  void _toggleButtonPressed(int row, int col) {
    setState(() {
      _buttonStatesPressed[row][col] = true;
    });
  }

  void _toggleButtonHit(int row, int col, List<dynamic> BarcosList) {
    setState(() {
      _buttonStatesHit[row][col] = true;
      for (int i = 0; i < BarcosList[0].length; i++) {
        for (int j = 0; j < 2; j++) {
          if (BarcosList[1][i][j] == [row, col] &&
                  BarcosList[1][i + 1][j] == [row + 1, col] ||
              BarcosList[1][i][j] == [row, col] &&
                  BarcosList[1][i][j + 1] == [row, col + 1]) {
            _counterhits--;
          }
        }
      }
    });
  }

  bool _compare(List<dynamic> AttackList, List<dynamic> DefenseList) {
    bool iguales = true;
    for (int i = 0; i < AttackList.length; i++) {
      for (int j = 0; j < AttackList.length; j++) {
        if (AttackList[i][j] != DefenseList[i][j]) {
          iguales = false;
        }
      }
    }

    return iguales;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context)?.settings.arguments;
    final List<dynamic> _buttonStatesDefense =
        args is List<dynamic> ? args : [];

    for (int i = 0; i < _buttonStatesDefense[1].length; i++) {
      for (int j = 0; j < 2; j++) {
        if (_buttonStatesDefense[1][i][j] != [null, null]) {
          _counterhits++;
        }
      }
    }
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
              padding: EdgeInsets.only(left: 60.0, bottom: 20.0, right: 60.0),
              child: Text(
                'ATTACK YOUR OPONENT',
                textScaleFactor: 2,
                style: GoogleFonts.spaceMono(
                  textStyle: TextStyle(color: Colors.red, letterSpacing: .8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  60.0,
                  0.0,
                  60.0,
                  0.0,
                ),
                child: GridView.builder(
                  itemCount: 25,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    int row = index ~/ 5;
                    int col = index % 5;
                    return ElevatedButton(
                      onPressed: () {
                        _toggleButtonState(row, col);
                        _toggleButtonPressed(row, col);
                        onPressedButton();
                        if (_buttonStatesAttack[row][col] ==
                            _buttonStatesDefense[0][row][col]) {
                          _toggleButtonHit(row, col, _buttonStatesDefense[1]);
                        }
                        _countertries++;
                        print(_countertries);
                        if (_compare(
                            _buttonStatesHit, _buttonStatesDefense[0])) {
                          Navigator.pushNamed(context, '/Win');
                        }
                        print("hits: $_counterhits");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors
                                  .blue; // Color del botón cuando está presionado
                            } else if (_buttonStatesPressed[row][col]) {
                              if (_buttonStatesAttack[row][col] ==
                                  _buttonStatesDefense[0][row][col]) {
                                return Colors.red;
                              } else {
                                return Colors.grey;
                              } // Color del botón cuando el estado es verdadero
                            } else {
                              return Colors
                                  .blue; // Color del botón cuando el estado es falso
                            }
                          },
                        ),
                      ),
                      child: Text(''),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.0, bottom: 60.0, right: 60.0),
              child: Text(
                'Attempts: $_countertries',
                textScaleFactor: 1.5,
                style: GoogleFonts.spaceMono(
                  textStyle: TextStyle(color: Colors.black, letterSpacing: .8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
