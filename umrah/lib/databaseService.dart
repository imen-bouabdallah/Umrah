import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:umrah/CreateDB.dart';
import 'package:umrah/Duaa.dart';

class DB {

  static const _databaseName = "_prayers2.db";
  static Future<Database> database() async{
    return openDatabase(
      _databaseName ,
      onCreate: (db, version) {
        db.execute(
          CreateDB().create(),
        );
        db.execute(
          CreateDB().create2(),
        );
        db.execute(
          CreateDB().create3(),
        );
        db.execute(
          CreateDB().create4(),
        );
        db.execute(
          CreateDB().create5(),
        );
        db.execute(
          CreateDB().create6(),
        );
        db.execute(
          CreateDB().create7(),
        );
        db.execute(
          CreateDB().create8(),
        );
        db.execute(
          CreateDB().create9(),
        );
        db.execute(
          CreateDB().create10(),
        );
      },

      version: 1,
    );



  }
  static int x= 0;
  /*Future<void> initDB() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);
    print(path);
    WidgetsFlutterBinding.ensureInitialized();
    _database = await openDatabase(
        path, version: 1,
        onCreate: (db, version) async{
          await db.execute(
            CreateDB().create(),
          );
        },

    );
  }*/
  Future<List<Duaa>> fetch(String table) async {
    if (x==0){
      insert();
    }


    final db = await DB.database();
    List<Map> results = await db.rawQuery("SELECT * FROM [$table]");
    return List.generate(results.length, (i) {
      return Duaa(
        id: results[i]['id'],
        duaa: results[i]['duaa'],
      );
    });


    /*results.forEach((result) {
      Duaa product = Duaa.fromMap(result);
      products.add(product);
    });*/

  }

  Future<void> insert() async {
    x = x+1;
    final db = await DB.database();
    db.rawQuery(CreateDB().insert7());
    db.rawQuery(CreateDB().insert3());

    db.rawQuery(CreateDB().insert());
    db.rawQuery(CreateDB().insert_1());
    db.rawQuery(CreateDB().insert_2());
    db.rawQuery(CreateDB().insert_3());
    db.rawQuery(CreateDB().insert_4());
    db.rawQuery(CreateDB().insert_5());
    db.rawQuery(CreateDB().insert_6());
    db.rawQuery(CreateDB().insert_7());
    db.rawQuery(CreateDB().insert_8());
    db.rawQuery(CreateDB().insert_9());
    db.rawQuery(CreateDB().insert_10());
    db.rawQuery(CreateDB().insert_11());

    db.rawQuery(CreateDB().insert2());
    db.rawQuery(CreateDB().insert2_1());
    db.rawQuery(CreateDB().insert2_2());
    db.rawQuery(CreateDB().insert2_3());

    db.rawQuery(CreateDB().insert4());
    db.rawQuery(CreateDB().insert4_1());
    db.rawQuery(CreateDB().insert4_2());

    db.rawQuery(CreateDB().insert5());
    db.rawQuery(CreateDB().insert5_1());


    db.rawQuery(CreateDB().insert6_7());
    db.rawQuery(CreateDB().insert6_6());
    db.rawQuery(CreateDB().insert6_5());
    db.rawQuery(CreateDB().insert6_4());
    db.rawQuery(CreateDB().insert6_3());
    db.rawQuery(CreateDB().insert6_2());
    db.rawQuery(CreateDB().insert6_1());
    db.rawQuery(CreateDB().insert6());

    db.rawQuery(CreateDB().insert8());

    db.rawQuery(CreateDB().insert9());

    db.rawQuery(CreateDB().insert10_1());
    db.rawQuery(CreateDB().insert10_2());
    db.rawQuery(CreateDB().insert10_3());

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