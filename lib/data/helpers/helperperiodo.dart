
import 'package:magister_mobile/data/helpers/helperbase.dart';
import 'package:magister_mobile/data/models/periodoletivo.dart';

class HelperPeriodo extends HelperBase<PeriodoLetivo> {
  static final String periodoTable = "tb_periodo";
  static final String anoColumn = "ano";
  static final String semestreColumn = "semestre";
  static final String dataInicioColumn = "data_inicio";
  static final String dataFinalColumn = "data_final";
  
  static final HelperPeriodo _instance = HelperPeriodo.getInstance();

  factory HelperPeriodo() => _instance;
  HelperPeriodo.getInstance();

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
  Future<PeriodoLetivo> getFirst(int id) {
    // TODO: implement getFirst
    return null;
  }

  @override
  Future<int> getNumber() {
    // TODO: implement getNumber
    return null;
  }

  @override
  Future<PeriodoLetivo> save(PeriodoLetivo curso) {
    // TODO: implement save
    return null;
  }

  @override
  Future<int> update(PeriodoLetivo data) {
    // TODO: implement update
    return null;
  }
}