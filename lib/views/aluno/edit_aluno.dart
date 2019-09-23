import 'package:flutter/material.dart';
import 'package:magister_mobile/data/helpers/helperaluno.dart';
import 'package:magister_mobile/data/helpers/helpercurso.dart';
import 'package:magister_mobile/data/models/aluno.dart';
import 'package:magister_mobile/data/models/curso.dart';

class EditAluno extends StatefulWidget {
  final bool edit;
  final Aluno aluno;

  EditAluno(this.edit, {this.aluno}) : assert(edit == true || aluno == null);
  @override
  _EditCursoState createState() => _EditCursoState();
}

class _EditCursoState extends State<EditAluno> {
  TextEditingController nomeController = new TextEditingController();
  TextEditingController totalCreditoController = new TextEditingController();
  TextEditingController dataController = new TextEditingController();
  TextEditingController mgpController = new TextEditingController();
  TextEditingController idCursoController = new TextEditingController();
  Curso selected;
  String current = "Selecione Curso";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.edit == true) {
      idCursoController.text = selected.id.toString();
      nomeController.text = widget.aluno.nome.toString();
      totalCreditoController.text = widget.aluno.totalCredito.toString();
      dataController.text = widget.aluno.dataNascimento.toString();
      mgpController.text = widget.aluno.mgp.toString();
      idCursoController.text = widget.aluno.curso.id.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? "Edit Person" : "Add person"),
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
                    Icons.person, widget.edit ? widget.aluno.nome : "s"),
                textFormField(
                    totalCreditoController,
                    "total crédito",
                    "Insira o total de credito",
                    Icons.place,
                    widget.edit ? widget.aluno.totalCredito : "jk"),
                textFormField(dataController, "Data de nascimento", "Insira um data",
                    Icons.person, widget.edit ? widget.aluno.nome : "d"),
                textFormField(mgpController, "MGP", "MGP",
                    Icons.person, widget.edit ? widget.aluno.nome : "m"),
                Container(
                  height: 70,
                  child: FutureBuilder<List>(
                      future: HelperCurso.getInstance().getAll(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return DropdownButton<Curso>(
                          items: snapshot.data
                              .map((curso) => DropdownMenuItem<Curso>(
                                    child: Text(curso.nomeCurso),
                                    value: curso,
                                  ))
                              .toList(),
                          onChanged: (Curso value) {
                            setState(() {
                              selected = value;
                              idCursoController.text = selected.id.toString();
                              current = value.nomeCurso;
                            });
                          },
                          isExpanded: false,
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
                      HelperAluno.getInstance().update(new Aluno(
                        id: widget.aluno.id,
                        nomeAluno: nomeController.text,
                        totalCredito: int.parse(totalCreditoController.text),
                        dataNascimento: dataController.text,
                        mgp: double.parse(mgpController.text),
                        idCurso: int.parse(idCursoController.text),
                      ));
                      Navigator.pop(context);
                    } else {
                      await HelperAluno.getInstance().save(
                        new Aluno(
                         nomeAluno: nomeController.text,
                        totalCredito: int.parse(totalCreditoController.text),
                        dataNascimento: dataController.text,
                        mgp: double.parse(mgpController.text),
                        idCurso: int.parse(idCursoController.text),
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
