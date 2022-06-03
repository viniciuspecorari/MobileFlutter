import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Nada salvo!";
  TextStyle estiloTexto = TextStyle(fontSize: 25, color: Colors.white);
  TextStyle colorContainer = TextStyle(color: Colors.black);
  bool valorDia = false;
  bool valorPequeno = false;
  String textoSalvo = "";
  String temaSalvo = "";

  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    String estiloTextoDefinido = valorPequeno.toString();
    String colorContainerDefinido = valorDia.toString();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    await prefs.setString("texto", estiloTextoDefinido);
    await prefs.setString("tema", colorContainerDefinido);
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome").toString();

      textoSalvo = prefs.getString("texto").toString();
      temaSalvo = prefs.getString("tema").toString();

      if (textoSalvo == "false") {
        valorPequeno = false;
      } else {
        valorPequeno = true;
      }

      if (temaSalvo == "false") {
        valorDia = false;
      } else {
        valorDia = true;
      }
    });

    print("Método Recuperar:  $_textoSalvo");
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("nome");

    print("Método Remover");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualização de Frases"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //Tema dia
                Row(
                  children: <Widget>[
                    Text(
                      "Tema dia:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                        value: valorDia,
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            valorDia = value;
                            if (valorDia == true) {
                              valorDia = value;
                              colorContainer = TextStyle(color: Colors.white);
                              estiloTexto = TextStyle(
                                  color: Colors.black,
                                  fontSize: estiloTexto.fontSize);
                            } else if (valorDia == false) {
                              valorDia = value;
                              colorContainer = TextStyle(color: Colors.black);
                              estiloTexto = TextStyle(
                                  color: Colors.white,
                                  fontSize: estiloTexto.fontSize);
                            }
                          });
                        }),
                  ],
                ),
                //texto pequeno
                Row(
                  children: <Widget>[
                    Text(
                      "Texto menor:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                        value: valorPequeno,
                        activeTrackColor: Colors.black,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            valorPequeno = value;

                            if (valorPequeno == true) {
                              valorPequeno = value;
                              estiloTexto = TextStyle(
                                  fontSize: 15, color: estiloTexto.color);
                            } else if (valorPequeno == false) {
                              valorPequeno = value;
                              estiloTexto = TextStyle(
                                  fontSize: 25, color: estiloTexto.color);
                            }
                          });
                        }),
                  ],
                ),
              ],
            ),

            //TEXT AREA
            Card(
                color: colorContainer.color,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: estiloTexto,
                    maxLines: 15, //or null
                    decoration: InputDecoration(
                        labelText: "Insira sua frase aqui!",
                        fillColor: Colors.lightBlue),
                    controller: _controllerCampo,
                    keyboardType: TextInputType.text,

                    //_textoSalvo,
                    //style: TextStyle(fontSize: 20),
                  ),
                )),

            Row(children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(25),
                child: Text("Salvar", style: TextStyle(fontSize: 15)),
                onPressed: _salvar,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(25),
                child: Text("Recuperar", style: TextStyle(fontSize: 15)),
                onPressed: _recuperar,
              ),
            ]),

            Container(
              color: colorContainer.color,
              child: Text(
                _textoSalvo,
                style: estiloTexto,
              ),
            )
          ],
        ),
      ),
    );
  }
}
