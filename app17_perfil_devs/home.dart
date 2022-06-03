import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController perfilController = TextEditingController();
  String resposta = '';

  String base_url = "https://api.github.com/users/";
  String getURL() {
    return base_url + perfilController.text;
  }

  _recuperarCep() async {
    print(getURL());

    http.Response response = await http
        .get(Uri.parse(getURL()), headers: {"Accept": "application/json"});
    print(response.body);
    Map<String, dynamic> retorno = json.decode(response.body);

    String Id = retorno["id"];
    String Nome = retorno["login"];
    String Repositorios = retorno["html_url"];
    String CriadoEm = retorno["created_at"];
    String Seguidores = retorno["followers_url"];
    String Seguindo = retorno["following_url"];

    setState(() {
      resposta =
          'Id: $Id \n Nome: $Nome \n Repositorios: $Repositorios \n Criado em: $CriadoEm \n Seguidores: $Seguidores \n Seguindo: $Seguindo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta perfil de devs"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Informe o perfil do usuário que deseja consultar",
                  labelStyle: TextStyle(color: Colors.blue)),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: perfilController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarCep,
                  child: Text("Consultar",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
            Text(resposta,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
