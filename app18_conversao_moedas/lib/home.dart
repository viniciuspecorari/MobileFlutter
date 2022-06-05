import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String moeda1 = 'De';
  String moeda2 = 'Para';
  String resposta = 'Valor convertido';
  double total = 0;
  double v1 = 0;

  TextEditingController N1Controller = TextEditingController();

  String base_url = "https://economia.awesomeapi.com.br/json/last/";
  String getURL() {
    return base_url + moeda1 + '-' + moeda2;
  }

  _valorConvertido() async {
    v1 = double.parse(N1Controller.text);

    print('URL: ' + getURL());
    http.Response response = await http.get(Uri.parse(getURL()));
    print('response.body: ${response.body}');

    Map<String, dynamic> retorno = jsonDecode(response.body);
    print('JSON da varivael Retorno: ${retorno}');
    print('Ask: ${retorno['ask']}');

    //Não consegui pegar o valor
    double Cotacao = retorno['ask'];
    print('Cotacao: ${Cotacao}');

    //realizando contas
    setState(() {
      total = v1 * Cotacao;
      resposta = 'Valor convertido: $total';
    });
  }

  _dropdownMoeda1() {
    return DropdownButton<String>(
      value: moeda1,
      items: <String>['De', 'BRL', 'USD', 'EUR', 'BTC'].map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (String valorSelecionado) {
        setState(() {
          moeda1 = valorSelecionado;
        });
      },
    );
  }

  _dropdownMoeda2() {
    return DropdownButton<String>(
      value: moeda2,
      items: <String>['Para', 'BRL', 'USD', 'EUR', 'BTC'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String valorSelecionado) {
        setState(() {
          moeda2 = valorSelecionado;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversão de Moedas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Informe o valor a ser convertido",
                  labelStyle: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              controller: N1Controller,
            ),
            _dropdownMoeda1(),
            _dropdownMoeda2(),
            Text(resposta,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _valorConvertido,
                  child: Text("Converter",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
