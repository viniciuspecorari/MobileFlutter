import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'saibamais.dart';

class home extends StatelessWidget {
  String base_url = "https://sujeitoprogramador.com/r-api/?api=filmes";
  String sinopseSh = "";
  String sinopseVg = "";

  String getURL() {
    return base_url;
  }

  _RetornaLivros() async {
    http.Response response = await http.get(Uri.parse(getURL()));
    print('JSON da varivael response: ${response.body}');

    //var retorno = json.decode(response.body);
    Map<String, dynamic> retorno = json.decode(response.body);
    print('Varivael Retorno: ${retorno.toString()}');

    //sinopseSh = retorno['id'];
    //print("Retorno: $retorno");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(context),
      ),
    );
  }

  _titulo() {
    return AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
        backgroundColor: Colors.blue);
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: _texto("Vingadores"),
                      padding: EdgeInsets.all(50),
                    ),
                    Container(
                      child: _botao(context, 'Saiba mais'),
                      padding: EdgeInsets.all(50),
                    ),
                  ],
                ),
                Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/81czyYh+PWL.jpg',
                  height: 500,
                  width: 500,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: _texto("Shazam"),
                      padding: EdgeInsets.all(50),
                    ),
                    Container(
                      child: _botao(context, 'Saiba mais'),
                      padding: EdgeInsets.all(50),
                    ),
                  ],
                ),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/pt/5/50/Shazam%21.jpg',
                  height: 500,
                  width: 500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _texto(texto) {
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

  _botao(BuildContext context, String textoBotao) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickOutraTela(context);
          _RetornaLivros();
        });
  }

  _onClickOutraTela(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return saibamais();
      }),
    );
  }
}
