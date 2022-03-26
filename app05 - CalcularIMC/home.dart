import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  
  String infoResultado = "";
 
  void _calcularIMC() {
    setState(() {
      double altura = double.parse(n1Controller.text);
      double peso = double.parse(n2Controller.text);
 
      double resultado = peso / (altura*altura) ;

      if(resultado < 18.5){
          infoResultado = 'Você esta abaixo do peso!';
      }else if(resultado >= 18.5 && resultado <= 24.9){
          infoResultado = 'Você esta com o peso ideal!';
      }else if(resultado >=25 && resultado <=29.9){
          infoResultado = 'Você esta acima do peso';
      }else if(resultado >= 30 && resultado <= 34.9 ){
          infoResultado = 'Você esta com obesidade de Grau 1!';
      }else if(resultado >= 35 && resultado <= 39.9){
          infoResultado = 'Você esta com obesidade de Grau 2!';
      }else{
        infoResultado = 'Você esta com obesidade de Grau 3 ou Mórbida!';
      }


      
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
      title: Text("Alcool ou Gasolina"),
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
          _campo("Altura:", n1Controller),
          _campo("Peso:", n2Controller),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }
 
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularIMC,
          child: Text("Calcular",
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
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }

  _imagem(){
    return Center(
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/1934/1934400.png',
        height: 90,
        width: 90,
        
      ),      
    );
  }
}