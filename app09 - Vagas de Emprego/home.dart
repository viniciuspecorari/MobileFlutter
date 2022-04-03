import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _ExibirTexto() {
    setState(() {});
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
      title: Text(
        "VAGAS DE EMPREGO",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  _corpo() {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 20, bottom: 20),
      child: ListView(
        children: <Widget>[
          _container('Engenheiro de Software', 'Salário: R\$ 4.000',
              'Descrição: Testetestetsetsetstetststststst\n\n'),
          _container('Analista de Sistemas', 'Salário: R\$ 2.500',
              'Descrição: Testetestetsetsetstetststststst\n\n'),
          _container('Programador C#', 'Salário: R\$ 4.000',
              'Descrição: Testetestetsetsetstetststststst\n\n'),
        ],
      ),
    );
  }

  _container(String vaga, String salario, String descricao) {
    return Container(
      child: Column(
        children: <Widget>[
          _Titulo(vaga),
          _texto(salario),
          _texto(descricao),
        ],
      ),
    );
  }

  _Titulo(titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
    );
  }

  _texto(texto) {
    return Text(
      texto,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        // fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
    );
  }
}
