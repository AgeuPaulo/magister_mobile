
import 'package:flutter/material.dart';
import 'package:magister_mobile/data/models/curso.dart';
import 'package:magister_mobile/data/models/periodoletivo.dart';
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
  TextEditingController nomeController = new TextEditingController();
  TextEditingController totalCreditoController = new TextEditingController();
  TextEditingController dataController = new TextEditingController();
  TextEditingController mgpController = new TextEditingController();
  TextEditingController idCursoController = new TextEditingController();

  PeriodoLetivo selectedPeriodo;
  String currentPeriodo = "Selecione o período letivo";
  Curso selectedCurso;
  String currentCurso = "Selecione Curso";

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}