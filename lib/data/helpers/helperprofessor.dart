import 'package:magister_mobile/data/helpers/helperbase.dart';
import 'package:magister_mobile/data/models/professor.dart';
import 'package:sqflite/sqflite.dart';

class HelperProfessor extends HelperBase<Professor> {
  static final String professorTable = "tb_professor";
  static final String idColumn = "id";
  static final String nomeColumn = "nome";
  static final String matriculaColumn = "matricula";
  static final HelperProfessor _instance = HelperProfessor.getInstance();

  factory HelperProfessor() => _instance;
  HelperProfessor.getInstance();

@override
  Future<Professor> save(Professor professor) async {
    Database dbContact = await db;
    professor.id = await dbContact.insert(professorTable, professor.toMap());
    return professor;
  }

@override
  Future<Professor> getFirst(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(professorTable,
        columns: [
          idColumn,
          nomeColumn,
          matriculaColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);

    if (maps.length > 0) {
      return Professor.fromMap(maps.first);
    } else {
      return null;
    }
  }

@override
  Future<int> delete(int id) async {
    Database dbProfessor = await db;
    return await dbProfessor
        .delete(professorTable, where: "$idColumn = ?", whereArgs: [id]);
  }

@override
  Future<int> update(Professor professor) async {
    Database dbContact = await db;
    return await dbContact.update(professorTable, professor.toMap(),
        where: "$idColumn = ?", whereArgs: [professor.id]);
  }

@override
  Future<List> getAll() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $professorTable");
    List<Professor> listProf = List();
    for (Map m in listMap) {
      listProf.add(Professor.fromMap(m));
    }
    return listProf;
  }

@override
  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM $professorTable"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
