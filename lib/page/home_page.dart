import 'package:flutter/material.dart';
import '../widget/button_image.dart';
import '../widget/button_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _display = "0";
  String _result = "0";
  String _operation = "";
  double _numberOne = 0;
  double _numberTwo = 0;

  void onclick(String text) {
    setState(() {
      if (text == "C") {
        _display = "0";
        _result = "0";
        _numberOne = 0;
        _numberTwo = 0;
        _operation = "";
      } else if (text == "delete") {
        _display = _display.length > 1 ? _display.substring(0, _display.length - 1) : "0";
      } else if (text == "plus" || text == "minus" || text == "multiplication" || text == "divide" || text == "%") {
        _numberOne = double.parse(_display);
        _operation = text;
        _display = "0";
      } else if (text == "equal") {
        _numberTwo = double.parse(_display);
        switch (_operation) {
          case "plus":
            _result = (_numberOne + _numberTwo).toString();
            break;
          case "minus":
            _result = (_numberOne - _numberTwo).toString();
            break;
          case "multiplication":
            _result = (_numberOne * _numberTwo).toString();
            break;
          case "divide":
            _result = _numberTwo != 0 ? (_numberOne / _numberTwo).toString() : "Loi";
            break;
          case "%":
            _result = (_numberOne % _numberTwo).toString();
            break;
        }
        _display = _result;
        _operation = "";
      } else if (text == "swap") {
        _display = _display.startsWith("-") ? _display.substring(1) : "-$_display";
      } else {
        _display = _display == "0" ? text : _display + text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  ButtonText(text: "C", color: Colors.blue, onclick: onclick),
                  ButtonText(text: "%", color: Colors.blue, onclick: onclick),
                  ButtonImage(image: "delete", onclick: onclick),
                  ButtonImage(image: "plus", onclick: onclick),
                ],
              ),
              Row(
                children: [
                  ButtonText(text: "7", onclick: onclick),
                  ButtonText(text: "8", onclick: onclick),
                  ButtonText(text: "9", onclick: onclick),
                  ButtonImage(image: "minus", onclick: onclick),
                ],
              ),
              Row(
                children: [
                  ButtonText(text: "4", onclick: onclick),
                  ButtonText(text: "5", onclick: onclick),
                  ButtonText(text: "6", onclick: onclick),
                  ButtonImage(image: "multiplication", onclick: onclick),
                ],
              ),
              Row(
                children: [
                  ButtonText(text: "1", onclick: onclick),
                  ButtonText(text: "2", onclick: onclick),
                  ButtonText(text: "3", onclick: onclick),
                  ButtonImage(image: "divide", onclick: onclick),
                ],
              ),
              Row(
                children: [
                  ButtonImage(image: "swap", onclick: onclick),
                  ButtonText(text: "0", onclick: onclick),
                  ButtonText(text: ".", onclick: onclick),
                  ButtonImage(image: "equal", onclick: onclick, backgroundColor: Colors.blue),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
