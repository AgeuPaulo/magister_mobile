import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperprofessor.dart';
import 'package:magister_mobile/data/models/professor.dart';

class EditProfessor extends StatefulWidget {
  final bool edit;
  final Professor professor;

  EditProfessor(this.edit, {this.professor})
      : assert(edit == true || professor == null);

  @override
  _EditProfessorState createState() => _EditProfessorState();
}

class _EditProfessorState extends State<EditProfessor> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      nomeController.text = widget.professor.nomeProf;
      matriculaController.text = widget.professor.matricula.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? "Editar Professor" : "Novo Professor"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 200,
                ),
                textFormField(
                    nomeController,
                    "Nome",
                    "Insira um nome",
                    Icons.person,
                    widget.edit ? widget.professor.nomeProf : "s"),
                textFormField(
                    matriculaController,
                    "Matricula",
                    "Insira a matricula",
                    Icons.place,
                    widget.edit ? widget.professor.matricula : "jk"),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Carregando')));
                    } else if (widget.edit == true) {
                      HelperProfessor.getInstance().update(new Professor(
                        id: widget.professor.id,
                        matricula: int.parse(matriculaController.text),
                        nome: nomeController.text,
                      ));
                      Navigator.pop(context);
                    } else {
                      await HelperProfessor.getInstance().save(
                        new Professor(
                          nome: nomeController.text,
                          matricula: int.parse(matriculaController.text),
                        ), 
                      );
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

textFormField(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
    ),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      controller: t,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
