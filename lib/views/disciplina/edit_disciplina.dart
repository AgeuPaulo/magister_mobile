
import 'package:flutter/material.dart';
import 'package:magister_mobile/data/models/disciplina.dart';

class EditDisciplina extends StatefulWidget {
  final bool edit;
  final Disciplina disciplina;

  EditDisciplina(this.edit, {this.disciplina})
      : assert(edit == true || disciplina == null);
  @override
  _EditDisciplinaState createState() => _EditDisciplinaState();
}

class _EditDisciplinaState extends State<EditDisciplina> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}