import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  File file;
  String path_foto = '';
  TextEditingController Nome = TextEditingController();
  TextEditingController Area = TextEditingController();
 
//Banco de dados
 _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco12.db");
 
    var retorno = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE ingressantes2 (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, area VARCHAR, foto VARCHAR) ";
      db.execute(sql);
    });
 
    print("aberto: " + retorno.isOpen.toString());
  }

 _salvar() async {
    Database bd = await _recuperarBancoDados();

    print(bd);
    print(Nome.text);
    print(Area.text);

    Map<String, dynamic> dadosUsuario = {
      "nome": Nome.text,
      "area": Area.text,
      "foto": 'https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1',
    };
    int id = await bd.insert("ingressantes2", dadosUsuario);
    print("Salvo: $id ");
  }

_listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    String sql = "SELECT * FROM ingressantes";
    List usuarios = await bd.rawQuery(sql);
 
    for (var usuario in usuarios) {
      print("item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " area: " +
          usuario['area']+
          " Foto: " +
           usuario['foto']
          );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confecção de Crachás"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Tire uma foto para o seu perfil",
            ),
            SizedBox(
              height: 20,
            ),
            file != null
                ? Image.file(file)
                : Icon(Icons.photo_camera_front_outlined, size: 110,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 60,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        _getImagemFromCamera();
                      }),
                  SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.image,
                        size: 60,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        _getImagemFromGaleria();
                      }),
                ],
              ),
            ),
        _campo("Nome:", Nome),
        _campo("Área:", Area),
        _botao("Cadastrar"),
          ],
        ),
      ),
    );
  }
 
  void _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
 
  void _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
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

    _botao(String textoBotao) {
    return RaisedButton(
        color: Colors.blue,
        padding: const EdgeInsets.all(16),
        
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            
          ),
        ),
        onPressed: () {
          _salvar();
        });
  }



    _botaoRecuperar(String textoBotao) {
    return RaisedButton(
        color: Colors.blue,
        padding: const EdgeInsets.all(16),
        
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            
          ),
        ),
        onPressed: () {
          _recuperarBancoDados();
        });
  }
}
 
