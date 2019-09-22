import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperprofessor.dart';
import 'package:magister_mobile/data/models/professor.dart';
import 'package:magister_mobile/views/professor/edit_professor.dart';

class HomeProfessor extends StatefulWidget {
  @override
  _HomeProfessorState createState() => _HomeProfessorState();
}

class _HomeProfessorState extends State<HomeProfessor> {

  @override
  void didUpdateWidget(HomeProfessor oldWidget) {
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
        future: HelperProfessor.getInstance().getAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Professor item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    HelperProfessor.getInstance().delete(item.id);
                  },
                  child: ListTile(
                    title: Text(item.nomeProf.toString()),
                    subtitle: Text(item.matricula.toString()),
                    leading: CircleAvatar(child: Text(item.id.toString())),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfessor(
                                true,
                                professor: item,
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
                MaterialPageRoute(builder: (context) => EditProfessor(false)));
          }),
    );
  }
}
