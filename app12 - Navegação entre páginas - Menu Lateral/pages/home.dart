import 'package:flutter/material.dart';
import 'pessoal.dart';
import 'experiencia.dart';
import 'formacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  String titulo = "Navegação Entre Menus";

  final telas = [
    Center(child: Text('')),
    pessoal(),
    experiencia(),
    formacao(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            FlutterLogo(size: 50),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do App'),
              trailing: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                  titulo = "Navegação Entre Menus";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Tela sobre mim'),

              onTap: () {
                setState(() {
                  _currentPage = 1;
                  titulo = "Pessoal";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Tela sobre minha formação'),

              onTap: () {
                setState(() {
                  _currentPage = 3;
                  titulo = "Formação";
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiência'),
              subtitle: Text('Tela sobre minha experiência Contatos do App'),

              onTap: () {
                setState(() {
                  _currentPage = 2;
                  titulo = "Experiência";
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text(titulo),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }
}
