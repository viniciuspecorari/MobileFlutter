import 'package:flutter/material.dart';

class experiencia extends StatelessWidget {
  const experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    return Container(
        child: Column(children: <Widget>[
      _titulo("Sobre minha experiência"),
      _conteudo(
          "Desde criança sou fascinado por jogos online e a partir dos meus 15 anos\ncomecei a criar pequenos jogos usando a ferramenta GameMaker. Com 16 entrei \npara etec, onde cursei técnico em informática. Desenvolvi diversos projetos \ne o principal deles foi meu tcc onde com ele, fui premiado pelo centro \npaula souza como melhor projeto acadêmico de acessibilidade voltado a \ndeficientes visuais. Com 17 anos, assim que terminei a etec, prestei o \nvestibular da fatec para cursar ads e consegui passar. Hoje trabalho na \nárea como Analista de Bi na empresa W5 Solutions e gerencio alguns projetos \nna fatec."),
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
                widthFactor: 3,
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
