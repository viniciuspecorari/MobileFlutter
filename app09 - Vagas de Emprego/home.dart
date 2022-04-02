import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  void _ExibirTexto() {
    setState(() {
  
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
      title: Text("VAGAS DE EMPREGO",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          _foto('VG1.png'),
          _foto('VG2.png'),
        ],
      ),
    );
  }
 
  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      fit: BoxFit.cover,
    );
  }
}


  _imagem() {
    return Center(
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/1934/1934400.png',
        height: 90,
        width: 90,
      ),
    );
  }

