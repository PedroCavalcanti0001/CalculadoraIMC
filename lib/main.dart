import 'package:calculadora_imc/ImcTable.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme: _Theme,
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                resetState();
              },
            ),
          ],
          title: Text(
            "Calculadora IMC",
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _weightController,
              validator: (validator) {
                return _weightValid ? "insira seu peso" : null;
              },
              autovalidate: _weightValid,
              autofocus: false,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black87, fontSize: 15),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.5),
                  ),
                  labelText: "Peso",
                  counterStyle: TextStyle(color: Colors.green),
                  labelStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _heightController,
              autofocus: false,
              keyboardType: TextInputType.number,
              validator: (validator) {
                return _weightValid ? "insira sua altura" : null;
              },
              autovalidate: _heightValid,
              style: TextStyle(color: Colors.black87, fontSize: 15),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 1.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.5),
                  ),
                  labelText: "Altura",
                  counterStyle: TextStyle(color: Colors.green),
                  labelStyle: TextStyle(color: Colors.green)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  updateState();
                },
                child: Text(
                  "CALCULAR",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                color: Colors.lightGreen,
              ),
            ),
          ),
          Text(_calcText)
        ],
      ),
    );
  }

  void updateState() {
    setState(() {
      validate();
      if (!_heightValid && !_weightValid) {
        int weight = int.parse(_weightController.value.text);
        double height = double.parse(_heightController.value.text);
        var result = weight / (height * 2);
        _calcText = ImcTable.getImc(result);
      }
    });
  }

  void validate() {
    _heightController.value.text.isEmpty
        ? _heightValid = true
        : _heightValid = false;

    _weightController.value.text.isEmpty
        ? _weightValid = true
        : _weightValid = false;
  }

  void resetState() {
    _weightValid = false;
    _heightValid = false;
    _heightController.value = TextEditingValue();
    _weightController.value = TextEditingValue();
    setState(() {
      _calcText = ImcTable.getImc(0);
    });
  }

  String _calcText = "Preencha os campos";

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  bool _weightValid = false;
  bool _heightValid = false;
}

final ThemeData _Theme = ThemeData(
  primarySwatch: Colors.green,
);
