import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValor = 'Sexo';
  String dropdownValorEscolaridade = 'Escolaridade';
  double valorSlider = 100;
  bool valorSwitch = false;
  String Resposta = "";

  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  

  void _ExibirTexto() {
    setState(() {
      Resposta = "Nome: ${n1Controller.text}\nIdade: ${n2Controller.text}\nEscolaridade: ${dropdownValorEscolaridade}\nLimite: ${valorSlider}\nBrasileiro: ${valorSwitch}";
    });
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
      title: Text("Abertura de Conta"),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //_imagem(),
          _campo("Nome:", n1Controller),
          _campo("Idade:", n2Controller),
          _dropdownSexo(),
          _dropdownEscolaridade(),

          Text(
            'Limite:',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          _slider(),

          Text(
            'Brasileiro:',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          _switch(),

          _botao(),
          _Resposta(Resposta),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      controller: objController,
    );
  }

  _dropdownSexo() {
    return DropdownButton<String>(
      value: dropdownValor,
      items: <String>['Sexo', 'Masculino', 'Feminino', 'Outro']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValor = valorSelecionado!;
        });
      },
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      value: dropdownValorEscolaridade,
      items: <String>[
        'Escolaridade',
        'Ensino Médio Completo',
        'Ensino Superior Completo',
        'Ensino Médio Incompleto'
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownValorEscolaridade = valorSelecionado!;
        });
      },
    );
  }

  _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 100,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }

  _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.blue,
      activeColor: Colors.blue,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _ExibirTexto,
          child: Text("Cadastrar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue,
        ),
      ),
    );
  }

    _Resposta(Resposta) {
    return Text(
      Resposta,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }

  _imagem() {
    return Center(
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/1934/1934400.png',
        height: 90,
        width: 90,
      ),
    );
  }
}
