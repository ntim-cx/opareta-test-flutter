import 'package:opareta_test/models/crypto_response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlService {
  static Database _database;
  static String tableCrypto ="tbl_crypto";

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('crypto.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const responseType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableCrypto ( 
  ${CryptoFields.id} $idType, 
  ${CryptoFields.response} $responseType
  )
''');
  }

  Future<int> insertCrypto(CryptoResponse cryptoResponse) async {
    final db = await database;

    final id = await db.insert(tableCrypto, cryptoResponse.encodeJson(cryptoResponse));
    return id;
  }

  Future<CryptoResponse> readCrypto() async {
    final db = await database;

    final maps = await db.query(
      tableCrypto,
    );

    if (maps.isNotEmpty) {
      return CryptoResponse.decodeJson(maps.last);
    } else {
      throw Exception('No item not found');
    }
  }
}
