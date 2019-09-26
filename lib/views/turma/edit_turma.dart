
import 'package:flutter/material.dart';
import 'package:magister_mobile/data/models/turma.dart';

class EditTurma extends StatefulWidget {
  final bool edit;
  final Turma turma;

  EditTurma(this.edit, {this.turma})
      : assert(edit == true || turma == null);

  @override
  _EditTurmaState createState() => _EditTurmaState();
}

class _EditTurmaState extends State<EditTurma> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}