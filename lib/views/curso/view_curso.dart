import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperaluno.dart';
import 'package:magister_mobile/data/helpers/helperdisciplina.dart';
import 'package:magister_mobile/data/helpers/helperprofessor.dart';
import 'package:magister_mobile/data/models/aluno.dart';
import 'package:magister_mobile/data/models/curso.dart';
import 'package:magister_mobile/data/models/disciplina.dart';
import 'package:magister_mobile/data/models/professor.dart';
import 'package:magister_mobile/views/curso/edit_curso.dart';

class ViewCurso extends StatefulWidget {
  final Curso curso;
  ViewCurso({this.curso});

  @override
  _ViewCursoState createState() => _ViewCursoState();
}

class _ViewCursoState extends State<ViewCurso> {
  HelperProfessor helperProfessor = new HelperProfessor();
  Professor coordenador;

  @override
  void initState() {
    super.initState();
    helperProfessor.getFirst(widget.curso.idCoordenador).then((value) {
      setState(() {
        coordenador = value;
      });
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditCurso(true, curso: widget.curso)));
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 0,
            child: ListTile(
              title: Text("Coordenador: " + coordenador.nomeProf),
              subtitle: Text(
                  "Total de créditos: " + widget.curso.totalCredito.toString()),
            ),
          ),
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
            child: FutureBuilder<List>(
              future:
                  HelperAluno.getInstance().getAllFromCurso(widget.curso.id),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  return LinearProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Aluno aluno = snapshot.data[index];
                      return ListTile(
                        title: Text(aluno.nome),
                      );
                    },
                  );
                }
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
            child: FutureBuilder<List>(
              future: HelperDisciplina.getInstance()
                  .getAllFromCurso(widget.curso.id),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  return LinearProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Disciplina disciplina = snapshot.data[index];
                      return ListTile(
                        title: Text(disciplina.nomeDisc),
                      );
                    },
                  );
                }
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
          Expanded(
            child: FutureBuilder<List>(
              future: HelperDisciplina.getInstance()
                  .getAllFromCurso(widget.curso.id),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  return LinearProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Disciplina disciplina = snapshot.data[index];
                      return ListTile(
                        title: Text(disciplina.nomeDisc),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
