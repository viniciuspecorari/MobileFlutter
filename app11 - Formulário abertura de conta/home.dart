import 'dart:convert';

import 'package:flutter/material.dart';
import 'Sobre.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValor = 'Selecione uma opção';
  double valorSlider = 20; 
  bool valorSwitch = false;
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

   String sexo = '';
   double limite = 0;
   bool nacionalidade = true;
   
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _titulo(),
          backgroundColor: Colors.white,
          body: _corpo(context),
        ),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Abertura de Conta - Formulário"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _campo('Digite o seu nome:', n1Controller),
            _campo('Digite a sua idade:', n2Controller),
            Text("Sexo"),
            _dropdown(),
            Text("Limite"),
            _slider(),
            Text("Brasileiro?"),
            _switch(),
            _botao(context, "Confirmar")
          ],
        ),
      ),
    );
  }


  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      controller: objController,
    );
  }


  _texto() {
    return Text(
      'Tela Home',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _botao(BuildContext context, String textoBotao) {
    return RaisedButton(
        color: Colors.green,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickNavegacao(context);
        });
  }

  _onClickNavegacao(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Sobre(valueNome: n1Controller.text, valueIdade: n2Controller.text, valueSexo: dropdownValor, valueLimite: valorSlider.toString(), valueNacionalidade: valorSwitch.toString(),);
        },
      ),
    );
  }

  _dropdown() {
    return DropdownButton<String>(
      value: dropdownValor,
      items: <String>['Selecione uma opção', 'Masculino', 'Feminino', 'Outros']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValor = valorSelecionado!;
        });
      },
    );
  }

  _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 100,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }

 _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue,
    );
  }
}


