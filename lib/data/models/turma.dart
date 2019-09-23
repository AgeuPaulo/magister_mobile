import 'package:magister_mobile/data/models/disciplina.dart';
import 'package:magister_mobile/data/models/periodoletivo.dart';
import 'package:magister_mobile/data/models/professor.dart';

class Turma {
  int _ano;
  int _semestre;
  int _idDisc;
  int _vagas;
  Professor _professor;
  Disciplina _disciplina;
  PeriodoLetivo _peridoLetivo;

  Turma(this._ano, this._semestre, this._idDisc, this._vagas);

  int get ano => this._ano;
  set ano(int ano) => this._ano = ano;

  int get semestre => this._semestre;
  set semestre(int semestre) => this._semestre = semestre;

  int get idDisc => this._idDisc;
  set idDisc(int idDisc) => this._idDisc = idDisc;

  int get vagas => this._vagas;
  set vagas(int vagas) => this._vagas = vagas;

  Professor get professor => this._professor;
  set professor(Professor professor) => this._professor = professor;

  Disciplina get disciplina => this._disciplina;
  set disciplina(Disciplina disciplina) => this._disciplina = disciplina;

  PeriodoLetivo get peridoLetivo => this._peridoLetivo;
  set periodoLetivo(PeriodoLetivo periodoLetivo) => this._peridoLetivo = periodoLetivo;
}
