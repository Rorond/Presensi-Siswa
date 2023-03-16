import 'package:get/get.dart' as getx;
import 'package:sqflite/sqflite.dart' as sql;

class DataBaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE mst_siswa(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nis TEXT,
        nama_siswa TEXT,
        tempat_lahir TEXT,
        alamat TEXT,
        hp TEXT,      
        image_url TEXT,
        created_by TEXT,
        created_date TEXT 
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'presensisiswa.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> deleteWhere(String table, String where, var val) async {
    final db = await DataBaseHelper.db();
    try {
      await db.delete(table, where: where, whereArgs: [val]);
    } catch (e) {
      getx.Get.snackbar("Sorry", "Failed to Delete Data");
    }
  }

  static Future<void> deleteAll(String table) async {
    final db = await DataBaseHelper.db();
    try {
      await db.delete(table);
    } catch (e) {
      getx.Get.snackbar("Sorry", "Failed to Delete Data");
    }
  }

  static Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await DataBaseHelper.db();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getWhere(
      String table, String where, var val) async {
    final db = await DataBaseHelper.db();
    return db.query(table, where: where, whereArgs: [val]);
  }

  static Future<int> insert(String table, var content) async {
    final db = await DataBaseHelper.db();
    final data = content;
    final id = await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> update(
      String table, var content, String where, String val) async {
    final db = await DataBaseHelper.db();
    final data = content;
    final result = await db.update(table, data, where: where, whereArgs: [val]);
    return result;
  }

  static Future<List<Map<String, dynamic>>> customQuery(String query) async {
    final db = await DataBaseHelper.db();
    return db.rawQuery(query);
  }
}
