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
 
  void _calcularPrecoGasosa() {
    setState(() {
      double n1 = 0;
      double n2 = 0;

      n1 = double.parse(n1Controller.text);
      n2 = double.parse(n2Controller.text);
 
      double resultado = n1 / n2 ;

      if(resultado < 0.7){
        infoResultado = 'O Acool é o melhor para abastecer!';
      }else{
        infoResultado = 'A Gasolina é o melhor para abastecer!';
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
      backgroundColor: Color.fromRGBO(255, 77, 28, 1),
      
      
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 30,),
          _imagem(),
          _campo("R\$ ALCOOL:", n1Controller),
          _campo("R\$ GASOLINA:", n2Controller),
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
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 18.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularPrecoGasosa,
          child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromRGBO(255, 77, 28, 1),
        ),
      ),
    );
  }
 
   _imagem(){
    return Center(
      child: Image.network(
        'https://cdn-icons.flaticon.com/png/512/3219/premium/3219521.png?token=exp=1648302926~hmac=db742ad25b50d6583ca5d4ac2ca7500f',
        height: 90,
        width: 90,
        
      ),      
    );
   }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue, fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}

