import 'package:flutter/cupertino.dart';
import 'package:health_check/features/emergency/data/model/contacts_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteHelper {
  late Database db;

  //1. create DB
  //2. create table
  //3. CRUD => create - read - update - delete

  //! initDatabase
  Future<void> initDB() async {
    // step 1 => create db
    await openDatabase(
      'contacts.db',
      version: 1,
      onCreate: (Database db, int version) async {
        // step 2 => create table
        await db.execute('''
        CREATE TABLE Contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, number TEXT)
          ''').then((value) => debugPrint("DB created successfully"));
      },
      onOpen: (db) => debugPrint('DB opened'),
    // ignore: invalid_return_type_for_catch_error
    ).then((value) => db = value).catchError((e) => debugPrint(e.toString()));
  }

  //! get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Contacts');
  }

  //! insert
  Future<int> insertToDB(ContactsModel model) async {
    return await db.rawInsert('''INSERT INTO Contacts(name, number)
    VALUES(
    '${model.name}', '${model.number}')''');
  }

  //! update DB
  // Future<int> updateDB(int id) async {
  //   return await db.rawUpdate('''
  //     UPDATE Tasks
  //     SET isCompleted = ?
  //     WHERE id = ?
  //     ''', [1, id]);
  // }

  //! delete from DB
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete('''
      DELETE FROM Contacts WHERE id = ?
      ''', [id]);
  }
}
