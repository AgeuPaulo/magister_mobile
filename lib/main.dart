import 'package:flutter/material.dart';
import 'package:magister_mobile/views/aluno/home_aluno.dart';
import 'package:magister_mobile/views/curso/home_curso.dart';
import 'package:magister_mobile/views/professor/home_professor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Principal"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Professor"),
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeProfessor()));
              },
            ),
            RaisedButton(
              child: Text("Curso"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeCurso()));
              },
            ),
            RaisedButton(
              child: Text("Aluno"),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeAluno()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
