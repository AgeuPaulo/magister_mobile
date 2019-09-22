import 'package:magister_mobile/data/models/curso.dart';

class Professor{

  int _id;
  int _matricula;
  String _nomeProf;
  Curso _curso;

  int get id => this._id;
  set id(int id) => this._id = id;

  int get matricula => this._matricula;
  set matricula(int matricula) => this._matricula = matricula;

  String get nomeProf => this._nomeProf;
  set nomeProf(String nomeProf) => this._nomeProf = nomeProf;

}