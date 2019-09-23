import 'dart:async';
import 'package:magister_mobile/data/helpers/helperbase.dart';
import 'package:magister_mobile/data/models/aluno.dart';
import 'package:sqflite/sqflite.dart';

class HelperAluno extends HelperBase<Aluno> {
  static final String alunoTable = "tb_aluno";
  static final String idColumn = "id";
  static final String nomeColumn = "nome";
  static final String totalCreditoColumn = "total_credito";
  static final String dataColumn = "data_nascimento";
  static final String mgpColumn = "mgp";
  static final String idCursoColumn = "id_curso";
  static final HelperAluno _instance = HelperAluno.getInstance();

  factory HelperAluno() => _instance;
  HelperAluno.getInstance();

  @override
  Future<int> delete(int id) {
    return null;
  }

  @override
  Future<List> getAll() async => db.then((database) async {
        List listMap = await database.rawQuery("SELECT * FROM $alunoTable");
        List<Aluno> lista = List();
        for (Map m in listMap) {
          lista.add(Aluno.fromMap(m));
        }
        return lista;
      });

  @override
  Future<Aluno> getFirst(int id) {
    // TODO: implement getFirst
    return null;
  }

  @override
  Future<int> getNumber() {
    // TODO: implement getNumber
    return null;
  }

  @override
  Future<Aluno> save(Aluno aluno) async {
    db.then((database) async {
      await database.insert(alunoTable, aluno.toMap());
    });
    return null;
  }

  @override
  Future<int> update(Aluno data) {
    // TODO: implement update
    return null;
  }

}
