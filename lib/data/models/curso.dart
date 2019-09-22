import 'package:magister_mobile/data/models/professor.dart';

class Curso {
  int _id;
  String _nomeCurso;
  int _totalCredito;
  int _idCoordenador;
  Professor _coordenador;

  int get id => this._id;
  set id(int id) => this._id = id;

  String get nomeCurso => this._nomeCurso;
  set nomeCurso(String nomeCurso) => this._nomeCurso = nomeCurso;

  int get totalCredito => this._totalCredito;
  set totalCredito(int totalCredito) => this._totalCredito = totalCredito;

  int get idCoordenador => this._idCoordenador;
  set idCoordenador(int idCoordenador) => this._idCoordenador = idCoordenador;

  set coordenador(Professor professor){
    this._coordenador = professor;
    this._idCoordenador = this._coordenador.id;
  } 

}
