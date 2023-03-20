import 'package:sqlite3/sqlite3.dart';

class dataBaseService{
  dataBaseService();

  List getData(String tableName){
    final db = sqlite3.open('assets/DataBase/prayerDB.sql');

    final ResultSet resultSet =
    db.select('SELECT duaa FROM $tableName ');

    db.dispose();

    List<String> list = <String>[]; int i = 0;

    for (Row row in resultSet){
      list[i] = row['duaa'];
      i++;
    }

    return list;
  }
}