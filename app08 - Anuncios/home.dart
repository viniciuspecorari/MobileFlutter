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
        "ANÚNCIOS",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _container('Aproveite já o nosso panetone\n TRADICIONAL DE FRUTAS!',
              'https://ofner.vteximg.com.br/arquivos/ids/156886/Banner%20Mobile%20Tradicional_460x300px.png?v=637713954359900000'),
          _container('Aproveite já o nosso panetone\n TRADICIONAL DE FRUTAS!',
              'https://ofner.vteximg.com.br/arquivos/ids/156881/Banner%20Desk%203%20-%20Banoffee.png?v=637713839119030000'),
          _container(
              'O SEGREDO DE UM LINDO NATAL É RECHEA-LO\n COM MUITO BOM GOSTO!',
              'https://ofner.vteximg.com.br/arquivos/ids/156880/Banner%20Desk%202%20-%20Novas%20Embalagens.png?v=637713838791270000'),
        ],
      ),
    );
  }

  _foto() {
    return Image.asset(
      "assets/images/assunto.jpg",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      fit: BoxFit.cover,
    );
  }
}

_container(String texto, String imagem) {
  return Container(
    alignment: Alignment.topCenter,
    child: Column(
      children: <Widget>[
        _imagem(imagem),
        _texto(''),
        _texto(texto),
      ],
    ),
  );
}

_imagem(String imagem) {
  return Center(
    child: Image.network(
      imagem,
      height: 300,
      width: 500,
    ),
  );
}

_texto(texto) {
  return Text(
    texto,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoMono',
    ),
  );
}
