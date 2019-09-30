import 'package:magister_mobile/data/helpers/helperprofessor.dart';

class Professor {
  int _id;
  String _nome;
  int _matricula;

  Professor({int id, String nome, int matricula}){
    this._id = id;
    this._nome = nome;
    this._matricula = matricula;
  }

  int get id => this._id;
  set id(int id) => this._id = id;

  int get matricula => this._matricula;
  set matricula(int matricula) => this._matricula = matricula;

  String get nomeProf => this._nome;
  set nomeProf(String nomeProf) => this._nome = nomeProf;

  Professor.fromMap(Map map) {
    _id = map[HelperProfessor.idColumn];
    _nome = map[HelperProfessor.nomeColumn];
    _matricula = map[HelperProfessor.matriculaColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      HelperProfessor.nomeColumn: this._nome,
      HelperProfessor.matriculaColumn: this._matricula
    };

    if (id != null) {
      map[HelperProfessor.idColumn] = this._id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return nomeProf;
  }
}
