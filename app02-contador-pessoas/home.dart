import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 



class _HomeState extends State<Home> {
 String infoResultado = "0";
 int contador =0;
 
  void _incrementar() {
    setState(() {
      contador++;
      infoResultado = "Pessoas: $contador";
    });
  }

  void _decrementar() {
    setState(() {
      if (--contador < 1){
        contador=0; 
      }else{
        contador--; 
      }
      
      infoResultado = "Pessoas: $contador";
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
      title: Text("Contador de pessoas"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto(infoResultado),
          _botaoIncrementar(),
          _botaoDecrementar(),
          
        ],
      ),
    );
  }
 
  _botaoIncrementar() {
    return Padding(
      padding: EdgeInsets.only(top: 170.0, bottom: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _incrementar,
          child: const Icon(Icons.add),
          //child: Text("Incrementar",
          //    style: TextStyle(color: Colors.white, fontSize: 20.0)),
         // color: Colors.blue,
        ),
      ),
    );
  }


    _botaoDecrementar() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _decrementar,

          child: const Icon(Icons.remove),
         // child: Text("Decrementar",
           //   style: TextStyle(color: Colors.white, fontSize: 20.0)),
         // color: Colors.blue,
          
        //),
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
}

