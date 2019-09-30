import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperaluno.dart';
import 'package:magister_mobile/data/helpers/helperdisciplina.dart';
import 'package:magister_mobile/data/helpers/helperprofessor.dart';
import 'package:magister_mobile/data/models/aluno.dart';
import 'package:magister_mobile/data/models/curso.dart';
import 'package:magister_mobile/data/models/disciplina.dart';

class ViewCurso extends StatefulWidget {
  final Curso curso;
  ViewCurso({this.curso});

  @override
  _ViewCursoState createState() => _ViewCursoState();
}

class _ViewCursoState extends State<ViewCurso> {
  HelperAluno helperAluno = new HelperAluno();
  HelperDisciplina helperDisciplina = new HelperDisciplina();
  HelperProfessor helperProfessor = new HelperProfessor();
  List<Disciplina> disciplinas = List();
  List<Aluno> alunos = List();

  @override
  void initState() {
    super.initState();
    helperDisciplina.getAllFromCurso(widget.curso.id).then((list) {
      setState(() {
        disciplinas = list;
        print(list);
      });
      print(disciplinas);
    });

    helperAluno.getAllFromCurso(widget.curso.id).then((list) {
      setState(() {
        alunos = list;
        print(list);
      });
      print(alunos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.curso.nomeCurso),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(widget.curso.coordenador.toString()),
              subtitle: Text(widget.curso.totalCredito.toString()),
            ),
          ),
          Card(
            color: Colors.deepOrange,
            elevation: 0,
            margin: EdgeInsets.all(8.0),
            child: Center(
              heightFactor: 1.5,
              child: Text(
                "Lista de todos os alunos do curso",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(alunos[index].nome),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Colors.deepOrange,
            elevation: 0,
            margin: EdgeInsets.all(8.0),
            child: Center(
              heightFactor: 1.5,
              child: Text(
                "Lista de todos as disciplinas do curso",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              itemCount: disciplinas.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.school),
                    title: Text(disciplinas[index].nomeDisc),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
