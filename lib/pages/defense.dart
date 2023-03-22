import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class DefenseScreen extends StatefulWidget {
  @override
  _ButtonGridState createState() => _ButtonGridState();
}

class _ButtonGridState extends State<DefenseScreen> {
  List<List<bool>> _buttonStates = List.generate(5, (_) => List.filled(5, false));

  void _toggleButtonState(int row, int col) {
    setState(() {
      _buttonStates[row][col] = !_buttonStates[row][col];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Grid'),
      ),
      body: GridView.builder(
        itemCount: 25,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          int row = index ~/ 5;
          int col = index % 5;
          return ElevatedButton(
            onPressed: () {
              _toggleButtonState(row, col);
              print(_buttonStates);
            },
            style: ElevatedButton.styleFrom(backgroundColor: _buttonStates[row][col] ? Colors.green : Colors.grey),
            child: Text(_buttonStates[row][col] ? 'ON' : 'OFF'),
          );
        },
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
