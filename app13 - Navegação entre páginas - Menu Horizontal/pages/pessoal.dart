import 'package:flutter/material.dart';

class pessoal extends StatelessWidget {
  const pessoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Container(
        child: Column(children: <Widget>[
      _titulo("Sobre mim"),
      _conteudo(
          "Meu nome é Vinicius Pecorari, tenho 19 anos. Sou aluno da Fatec Praia Grande,\nmoro em mongaguá a 5 anos e estou no meu último ano da faculdade!"),
    ]));
  }

  _titulo(titulo) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                heightFactor: 2,
                widthFactor: 6,
                child: Text(
                  titulo, //texto
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _conteudo(conteudo) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                conteudo, //texto
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.justify,
              ),
            ],
          )
        ],
      ),
    );
  }
}
