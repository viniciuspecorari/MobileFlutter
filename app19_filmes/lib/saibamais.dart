import 'package:flutter/material.dart';

class saibamais extends StatelessWidget {
  const saibamais({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saiba mais'),
      ),
      body: _corpo(context),
    );
  }

  _textoTitulo(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _textoCorpo(texto) {
    return Text(
      texto,
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          //decoration: TextDecoration.underline,
          decorationColor: Colors.black,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                children: [_textoTitulo("SINOPSE"), _textoCorpo("textossss")]),
          ],
        ),
      ),
    );
  }
}
