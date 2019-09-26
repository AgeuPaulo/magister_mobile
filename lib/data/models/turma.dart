import 'package:magister_mobile/data/helpers/helperturma.dart';
import 'package:magister_mobile/data/models/disciplina.dart';
import 'package:magister_mobile/data/models/periodoletivo.dart';
import 'package:magister_mobile/data/models/professor.dart';

class Turma {
  int _ano;
  int _semestre;
  PeriodoLetivo _peridoLetivo;
  int _vagas;
  int _idDisc;
  Disciplina _disciplina;
  int _idProf;
  Professor _professor;

  Turma({int ano, int semestre, int idDisc, int vagas, int idProf}){
    this._ano = ano;
    this._semestre = semestre;
    this._idDisc = idDisc;
    this._vagas = vagas;
    this._idProf = idProf;
  }

  int get ano => this._ano;
  set ano(int ano) => this._ano = ano;

  int get semestre => this._semestre;
  set semestre(int semestre) => this._semestre = semestre;

  int get idDisc => this._idDisc;
  set idDisc(int idDisc) => this._idDisc = idDisc;

  int get vagas => this._vagas;
  set vagas(int vagas) => this._vagas = vagas;

  Disciplina get disciplina => this._disciplina;
  set disciplina(Disciplina disciplina){
    this._disciplina = disciplina;
    this.idDisc = this._disciplina.id;
  }

  PeriodoLetivo get peridoLetivo => this._peridoLetivo;
  set periodoLetivo(PeriodoLetivo periodoLetivo){
      this._peridoLetivo = periodoLetivo;
      this._ano = this._peridoLetivo.ano;
      this._semestre = this._peridoLetivo.semestre;
  }

  int get idProf => this._idProf;
  set idProf(int idProf) => this._idProf = idProf;

  set professor(Professor professor) {
    this._professor = professor;
    this.idProf = this._professor.id;
  }

  Turma.fromMap(Map map) {
    _ano = map[HelperTurma.anoColumn];
    _semestre = map[HelperTurma.semestreColumn];
    _idDisc = map[HelperTurma.idDiscColumn];
    _vagas = map[HelperTurma.vagaColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      HelperTurma.vagaColumn: vagas,
      HelperTurma.idProfColumn: idProf,
    };

    if (ano != null && semestre != null && idDisc != null) {
      map[HelperTurma.anoColumn] = ano;
      map[HelperTurma.semestreColumn] = semestre;
      map[HelperTurma.idDiscColumn] = idDisc;
    }
    return map;
  }
}
