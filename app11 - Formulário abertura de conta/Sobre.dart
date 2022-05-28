import 'package:flutter/material.dart';
 
class Sobre extends StatelessWidget {
  String valueNome;
  String valueIdade;
  String valueSexo;
  String valueLimite;
  String valueNacionalidade;
  
  Sobre({required this.valueNome, required this.valueIdade, required this.valueSexo, required this.valueLimite, required this.valueNacionalidade});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(valueNome),
          Text(valueIdade),
          Text(valueSexo),
          Text(valueLimite),
          Text(valueNacionalidade),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),
        ],
      ),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context);
  }
}
