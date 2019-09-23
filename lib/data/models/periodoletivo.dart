import 'package:magister_mobile/data/models/turma.dart';

class PeriodoLetivo {
  int _ano;
  int _semestre;
  String _dataInicio;
  String _dataFinal;
  List<Turma> _turmas = new List();

  PeriodoLetivo(this._ano, this._semestre);

  int get ano => this._ano;
  set ano(int ano) => this._ano = ano;

  int get semestre => this._semestre;
  set semestre(int semestre) => this._semestre = semestre;

  String get dataInicio => this._dataInicio;
  set dataInicio(String dataInicio) => this._dataInicio = dataInicio;

  String get dataFinal => this._dataFinal;
  set dataFinal(String dataFinal) => this._dataFinal = dataFinal;

   List<Turma> get turmas => this._turmas;
  set turmas(List<Turma> turmas) => this._turmas = turmas;
  
}
