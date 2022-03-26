import 'package:flutter/material.dart';
 import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
  String infoResultado = "";
 
  void _Randomizar() {
    setState(() {

 
      int resultado = new Random().nextInt(10);
      infoResultado = resultado.toString();
      
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Jogo do Nº Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _imagem(),
          _mensagem(),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }
 
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _Randomizar,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }
 
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
    );
  }

  _mensagem(){
    return Center(
      child: Text(
        "Pense em um número de 0 a 10...",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontSize: 25.0),
        
      ),      
    );
  }



  _imagem(){
    return Center(
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/6662/6662934.png',
        height: 90,
        width: 90,
        
      ),      
    );
  }
}