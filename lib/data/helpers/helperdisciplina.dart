
import 'package:magister_mobile/data/helpers/helperbase.dart';
import 'package:magister_mobile/data/models/disciplina.dart';

class HelperDisciplina extends HelperBase<Disciplina> {
  static final String disciplinaTable = "tb_disciplina";

  static final String idColumn = "id";
  static final String nomeColumn = "nome";
  static final String creditosColumn = "creditos";
  static final String tipoColumn = "tipo";
  static final String hrsObgColumn = "hrs_obg";
  static final String limiteColumn = "limite";
  static final String idCursoColumn = "id_curso";
  static final HelperDisciplina _instance = HelperDisciplina.getInstance();

  factory HelperDisciplina() => _instance;
  HelperDisciplina.getInstance();

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
  Future<Disciplina> getFirst(int id) {
    // TODO: implement getFirst
    return null;
  }

  @override
  Future<int> getNumber() {
    // TODO: implement getNumber
    return null;
  }

  @override
  Future<Disciplina> save(Disciplina curso) {
    // TODO: implement save
    return null;
  }

  @override
  Future<int> update(Disciplina data) {
    // TODO: implement update
    return null;
  }
}