import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Simple Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String defaultOutput = "0";

  String _defaultOutput = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _defaultOutput = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(defaultOutput);
      operand = buttonText;
      _defaultOutput = "0";
    } else if (buttonText == ".") {
      if (_defaultOutput.contains(".")) {
        return;
      } else {
        _defaultOutput = _defaultOutput + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.tryParse(defaultOutput);

      if (operand == "+") {
        _defaultOutput = (num1 + num2).toString();
      }
      if (operand == "-") {
        _defaultOutput = (num1 - num2).toString();
      }
      if (operand == "X") {
        _defaultOutput = (num1 * num2).toString();
      }
      if (operand == "/") {
        _defaultOutput = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _defaultOutput = _defaultOutput + buttonText;
    }
    print(_defaultOutput);

    setState(() {
      if (buttonText == "=") {
        defaultOutput = double.parse(_defaultOutput).toStringAsFixed(2);
      } else {
        defaultOutput = double.parse(_defaultOutput).toStringAsFixed(0);
      }
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
          highlightColor: Colors.grey[300],
          padding: new EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Calculator',
                // backgroundColor: Colors.yellow,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blue,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info_outline,size: 35,color: Colors.white,),

            )
          ],
        ),
        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    color: Colors.grey[100],
                    alignment: Alignment.centerRight,
                    padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                    child: new Text(
                      defaultOutput,
                      style: new TextStyle(
                        fontFamily: 'Calculator',
                        fontSize: 75.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                new Expanded(

                  child: Container(
                    color: Colors.grey[100],
                  ),
                ),
                new Column(children: [
                  new Row(children: [
                    buildButton("C"),
                    buildButton("<="),
                    buildButton("/"),

                  ]),
                  new Row(children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("X"),
                  ]),
                  new Row(children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("+"),
                  ]),
                  new Row(children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ]),
                  new Row(children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("="),
                  ])
                ])
              ],
            )));
  }
}
