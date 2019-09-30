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
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.deepOrange,
            elevation: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lista de todos os alunos do curso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(alunos[index].nome),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    child: Text(alunos[index].id.toString()),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Colors.deepOrange,
            elevation: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lista de todos as disciplinas do curso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(disciplinas[index].nomeDisc),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    child: Text(disciplinas[index].id.toString()),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Colors.deepOrange,
            elevation: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lista de todos os professores do curso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
