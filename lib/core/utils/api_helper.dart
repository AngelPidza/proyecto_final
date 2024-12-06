// lib/core/utils/api_helper.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ApiHelper {
  final Db _db;

  ApiHelper() : _db = Db(dotenv.env['DATABASE_URL']!);

  Future<void> openConnection() async {
    if (!_db.isConnected) {
      await _db.open();
      print('Connected to MongoDB');
    }
  }

  Future<void> closeConnection() async {
    if (_db.isConnected) {
      await _db.close();
    }
  }

  DbCollection getCollection(String collectionName) {
    return _db.collection(collectionName);
  }
}
