import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "Users.db";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: (db, version) async {});
  }

  String getTableName(String userId) {
    return "user_$userId";
  }

  Future<void> createUserTable(String userId) async {
    final db = await database;
    String tableName = getTableName(userId);
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            username TEXT NOT NULL,
            dob TEXT NOT NULL,
            gender TEXT NOT NULL
          )
          ''');
  }

  Future<void> initializeEmptyValues(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> tables =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    print(tables);
    String tableName = getTableName(userId);
    await db.insert(tableName, {
      'name': '',
      'username': '',
      'dob': '',
      'gender': '',
    });
  }

  Future<bool> checkForEmptyFields(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> tables =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    print(tables);

    String tableName = getTableName(userId);
    final List<Map<String, dynamic>> records = await db.query(tableName);

    for (var record in records) {
      if (record.values.any((value) => value == '')) {
        return true;
      }
    }
    return false;
  }

  Future<void> updateUserData(
      String userId, Map<String, dynamic> updatedValues) async {
    final db = await database;
    String tableName = getTableName(userId);

    await db.update(
      tableName,
      updatedValues,
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final db = await database;
    String tableName = getTableName(userId);
    List<Map> records = await db.query(
      tableName,
    );
    if (records.isNotEmpty) {
      return records.first as Map<String, dynamic>?;
    }
    return null;
  }

  Future<void> ensureUserTableExistsAndPopulated(String userId, Map<String, dynamic> initialValues) async {
    final db = await database;
    String tableName = getTableName(userId);

    await createUserTable(userId);

    final List<Map> records = await db.query(tableName);
    if (records.isNotEmpty) {
      return;
    }

    List<String> columns = await _getTableColumns(db, tableName);
    Map<String, dynamic> filteredInitialValues = {};
    for (String column in columns) {
      if (initialValues.containsKey(column)) {
        filteredInitialValues[column] = initialValues[column];
      }
    }

    if (!filteredInitialValues.containsKey('dob')) {
      filteredInitialValues['dob'] = initialValues['dateOfBirth']; 
    }

    await db.insert(tableName, filteredInitialValues);
  }

 Future<List<String>> _getTableColumns(Database db, String tableName) async {
    final List<Map<String, dynamic>> columnInfo = await db.rawQuery('PRAGMA table_info($tableName);');
    return columnInfo.map((row) => row['name'] as String).toList();
  }


}
