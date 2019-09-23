import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperaluno.dart';
import 'package:magister_mobile/data/models/aluno.dart';
import 'package:magister_mobile/views/aluno/edit_aluno.dart';

class HomeAluno extends StatefulWidget {
  @override
  _HomeCursoState createState() => _HomeCursoState();
}

class _HomeCursoState extends State<HomeAluno> {
  @override
  void didUpdateWidget(HomeAluno oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter SQLite"),
      ),
      body: FutureBuilder<List>(
        future: HelperAluno.getInstance().getAll(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Aluno item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    HelperAluno.getInstance().delete(item.id);
                  },
                  child: ListTile(
                    title: Text(item.nome.toString()),
                    subtitle: Text(item.dataNascimento.toString()),
                    leading: CircleAvatar(child: Text(item.id.toString())),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditAluno(
                                true,
                                aluno: item,
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
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditAluno(false)));
          }),
    );
  }
}
