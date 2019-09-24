import 'package:magister_mobile/data/helpers/helperbase.dart';
import 'package:magister_mobile/data/models/turma.dart';

class HelperTurma extends HelperBase<Turma> {
  static final String turmaTable = "tb_turma";
  static final String anoColumn = "ano";
  static final String semestreColumn = "semestre";
  static final String idDiscColumn = "id_disc";
  static final String vagaColumn = "vaga";
  static final String idProfColumn = "id_prof";
  
  static final HelperTurma _instance = HelperTurma.getInstance();

  factory HelperTurma() => _instance;
  HelperTurma.getInstance();

  @override
  Future<int> delete(int id) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future<Turma> getFirst(int id) {
    // TODO: implement getFirst
    return null;
  }

  @override
  Future<int> getNumber() {
    // TODO: implement getNumber
    return null;
  }

  @override
  Future<Turma> save(Turma curso) {
    // TODO: implement save
    return null;
  }

  @override
  Future<int> update(Turma data) {
    // TODO: implement update
    return null;
  }

}