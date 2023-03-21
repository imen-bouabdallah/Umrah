import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:umrah/Duaa.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    print(database);
    return _database;
  }
  Future<Database >initDB() async {
    Directory documentsDirectory = await
    getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "prayer.db.sql");
    print(path);
    var exists = await databaseExists(path);
    print(exists);

    return await openDatabase(
        path, version: 1,
        onOpen: (db) {},
    );
  }
  Future<List<Duaa>> fetch(String table) async {
    final db = await database;

    List<Map> results = await db!.rawQuery("SELECT * FROM [$table]");
    List<Duaa> products = <Duaa>[];
   /* results.forEach((result) {
      Duaa product = Duaa.fromMap(result);
      products.add(product);
    });*/
    return products;
  }

}


/*import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{
  late Database _database ;

  Future<Database> open() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "/assets/DataBase/prayers.db");
    print(path);
    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e.toString());
      }

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "/DataBase/prayers.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      print("Database created successfully");
    } else {
      print("Opening existing database");
    }

    // open the database
    return await openDatabase(path, version: 1, readOnly: false);
  }

  Future<List<Map>> fetch(String tableName) async{ ///the return type is a list of map
    await open();
    List<Map> items = await _database.rawQuery('Select duaa from [$tableName];');
    return items;
  }
}
*/