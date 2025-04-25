import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/model/places.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT ,image TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class UserPlaceNotifier extends StateNotifier<List<Places>> {
  UserPlaceNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');

    final places =
        data
            .map(
              (row) => Places(
                id: row['id'] as String,
                title: row['title'] as String,
                image: File(row['image'] as String),
              ),
            )
            .toList();

    state = places;
  }

  void addPlace(String title, File image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/${filename}');

    final newPlace = Places(image: copiedImage, title: title);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });

    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<UserPlaceNotifier, List<Places>>(
  (ref) => UserPlaceNotifier(),
);
