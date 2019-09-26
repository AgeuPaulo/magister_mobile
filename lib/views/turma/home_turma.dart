

import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperturma.dart';
import 'package:magister_mobile/data/models/turma.dart';
import 'package:magister_mobile/views/turma/edit_turma.dart';

class HomeTurma extends StatefulWidget {
  @override
  _HomeTurmaState createState() => _HomeTurmaState();
}

class _HomeTurmaState extends State<HomeTurma> {

  @override
  void didUpdateWidget(HomeTurma oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TURMAS"),
        backgroundColor: Colors.teal,
        elevation: 1,
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: HelperTurma.getInstance().getAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Turma item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.teal),
                  onDismissed: (direction) {
                    HelperTurma.getInstance().deleteDisciplina(item.ano, item.semestre, item.idDisc);
                  },
                  child: ListTile(
                    title: Text(item.idDisc.toString()),
                    leading: CircleAvatar(backgroundColor: Colors.teal, child: Text(item.ano.toString() + "." + item.semestre.toString())),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditTurma(
                                true,
                                turma: item,
                              )));
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditTurma(false)));
          }),
    );
  }
}