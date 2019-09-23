import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helpercurso.dart';
import 'package:magister_mobile/data/helpers/helperprofessor.dart';
import 'package:magister_mobile/data/models/curso.dart';
import 'package:magister_mobile/data/models/professor.dart';

class EditCurso extends StatefulWidget {
  final bool edit;
  final Curso curso;

  EditCurso(this.edit, {this.curso}) : assert(edit == true || curso == null);
  @override
  _EditCursoState createState() => _EditCursoState();
}

class _EditCursoState extends State<EditCurso> {
  TextEditingController nomeController = new TextEditingController();
  TextEditingController totalCreditoController = new TextEditingController();
  TextEditingController idCoordenadorController = new TextEditingController();
  Professor selected;
  String current = "Selecione coordenador";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      idCoordenadorController.text = selected.id.toString();
      nomeController.text = widget.curso.nomeCurso.toString();
      totalCreditoController.text = widget.curso.totalCredito.toString();
      idCoordenadorController.text = widget.curso.idCoordenador.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? "Editar Curso" : "Adicionar Curso"),
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
                textFormField(nomeController, "Nome do curso", "Insira um nome",
                    Icons.person, widget.edit ? widget.curso.nomeCurso : "s"),
                textFormField(
                    totalCreditoController,
                    "total crédito",
                    "Insira o total de credito",
                    Icons.place,
                    widget.edit ? widget.curso.totalCredito : "jk"),
                Container(
                  height: 70,
                  child: FutureBuilder<List>(
                      future: HelperProfessor.getInstance().getAll(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return DropdownButton<Professor>(
                          items: snapshot.data
                              .map((professor) => DropdownMenuItem<Professor>(
                                    child: Text(professor.nomeProf),
                                    value: professor,
                                  ))
                              .toList(),
                          onChanged: (Professor value) {
                            setState(() {
                              selected = value;
                              idCoordenadorController.text = selected.id.toString();
                              current = value.nomeProf;
                            });
                          },
                          isExpanded: false,
                          //value: _currentUser,
                          hint: Text(current),
                        );
                      }),
                ),
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
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Carregando')));
                    } else if (widget.edit == true) {
                      HelperCurso.getInstance().update(new Curso(
                        id: widget.curso.id,
                        nomeCurso: nomeController.text,
                        totalCredito: int.parse(totalCreditoController.text),
                        idCoordenador: int.parse(idCoordenadorController.text),
                      ));
                      Navigator.pop(context);
                    } else {
                      await HelperCurso.getInstance().save(
                        new Curso(
                          nomeCurso: nomeController.text,
                          totalCredito: int.parse(totalCreditoController.text),
                          idCoordenador:
                              int.parse(idCoordenadorController.text),
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
