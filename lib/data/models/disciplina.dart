import 'package:magister_mobile/data/models/curso.dart';
import 'package:magister_mobile/data/models/turma.dart';

class Disciplina {
  int _id;
  String _nomeDisc;
  int _creditos;
  String _tipo;
  int _hrs;
  int _limiteFaltas;
  Turma _turma;
  Curso _curso;

  Disciplina(this._id, this._nomeDisc, this._creditos, this._tipo, this._hrs, this._limiteFaltas, {turma, curso});

  int get id => this._id;
  set id(int id) => this._id = id;

  String get nomeDisc => this._nomeDisc;
  set nomeDisc(String nomeDisc) => this._nomeDisc = nomeDisc;

  int get creditos => this._creditos;
  set creditos(int creditos) => this._creditos = creditos;

  String get tipo => this._tipo;
  set tipo(String tipo) => this._tipo = tipo;

  int get hrs => this._hrs;
  set hrs(int hrs) => this._hrs = hrs;

  int get limiteFaltas => this._limiteFaltas;
  set limiteFaltas(int limiteFaltas) => this._limiteFaltas = limiteFaltas;

  Turma get turma => this._turma;
  set turma(Turma turma) => this._turma = turma;

  Curso get curso => _curso;
  set curso(Curso curso) => this._curso = curso;
}
