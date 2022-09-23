import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String result = "0";

  String rs = "0";
  double a = 0.0;
  double b = 0.0;
  String op = "";

  buttonPressed(String buttonText){

    if(buttonText == "C"){

      rs = "0";
      a = 0.0;
      b = 0.0;
      op = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      a = double.parse(result);
      op = buttonText;
      rs = "0";

    } else if(buttonText == "."){

      if(rs.contains(".")){
        return;

      } else {
        rs = rs + buttonText;
      }

    } else if (buttonText == "="){

      b = double.parse(result);

      if(op == "+"){
        rs = (a + b).toString();
      }
      if(op == "-"){
        rs = (a - b).toString();
      }
      if(op == "X"){
        rs = (a * b).toString();
      }
      if(op == "/"){
        rs = (a / b).toString();
      }

      a = 0;
      b = 0;
      op = "";

    } else {

      rs = rs + buttonText;

    }


    setState(() {

      result = double.parse(rs).toStringAsFixed(0);

    });

  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(buttonText,
          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: Text(result, style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,

                ))),
            const Expanded(
              child: Divider(),
            ),


            Column(children: [
              Row(children: [
                buildButton("C"),
                buildButton("DEL"),
                buildButton("="),]),

              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("/")
              ]),

              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x")
              ]),

              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("-")
              ]),

              Row(children: [
                buildButton("0"),
                buildButton("00"),
                buildButton("."),
                buildButton("+"),
              ])
            ])
          ],
        ));
  }
}