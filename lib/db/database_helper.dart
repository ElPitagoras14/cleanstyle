import 'package:cleanstyle/models/clothe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'clean_style.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE clothes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          imagePath TEXT NOT NULL,
          name TEXT NOT NULL,
          dirty INTEGER NOT NULL,
          type TEXT NOT NULL,
          style TEXT NOT NULL,
          brand TEXT NOT NULL,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
        )
        ''',
      );
    });
  }

  static Future<void> insertClothesWithImage(Clothe clothes) async {
    final db = await initializeDb();
    await db.insert(
      'clothes',
      clothes.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
