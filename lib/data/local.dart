import 'package:sqflite/sqflite.dart';

import '../models/user_models.dart';
import '../models/medication_models.dart';

class LocalData {

  static String getDatabaseLocation() {
    String databasesPath = '';

    // Get a location using getDatabasesPath
    getDatabasesPath().then((path) => databasesPath = path).catchError((e) => e);

    return databasesPath;
  }

  static List<Map> getSpecificRecords(String path, String table, String val, String id) {
    List<Map> rows = [];

    // open the database
    openDatabase(
      path,
      onOpen: (db) {
        // Get the record
        db.rawQuery(
            'SELECT FROM ? WHERE ? = ?', [table, val ,id]
        ).then((list) => rows = list)
        // TODO: print that this user not exist or something like this
            .catchError((e) => e);
      },).then((db) => db.close())
    // TODO: print that there is no data or something like this
        .catchError((e) => e);

    return rows;
  }

  static Future<void> deleteRecord(String path, String id, String table) async {
    // create or open the database
    openDatabase(
      path,
      onOpen: (db) {
        // Get the record
        db.rawDelete('DELETE FROM ? WHERE id = ?', [table, id])
            .then((count) => {})
        // TODO: print that this data not exist or something like this
            .catchError((e) => e);
      });
  }

  static Future<void> deleteTable(String path, String table) async {
    // create or open the database
    openDatabase(
      path,
      onOpen: (db) {
        // Get the record
        db.delete(table);
      },);
  }

  static Future<void> countRows(String path, String table) async {
    // open the database
    openDatabase(
      path,
      onOpen: (db) {
        // Count the records
        db.rawQuery('SELECT COUNT(*) FROM ?', [table]);
        // TODO: print that this order not exist or something like this
        /*.then((list) => count = Sqflite.firstIntValue(list)!)
        .catchError((e) => e);*/
      },);
  }

  static void insertOrder(String orderId, MedicationDates order, String path, {int version = 1}) {
    // create or open the database
    openDatabase(
      path, version: 1,
      onCreate: (db, version) {
        // When creating the db, create the table
        db.execute(
            'CREATE TABLE Orders('
                'id TEXT, '
                'title TEXT, '
                'userLocation TEXT, '
                'receiverPN Text, '
                'time TEXT, '
                'price INTEGER, '
                'fee INTEGER'
                'userId TEXT, '
                'driverId TEXT'
                ')')
            .then((value) => {})
        // TODO: print that this path not exist something like this
            .catchError((e) => e);},

      onOpen: (db) {
        // When opening the db, insert new table
        db.rawInsert(
            'INSERT INTO Orders('
                'id, title, orderLocation, receiverPhoneNumber, time, price, fee, userId, driverId'
                ') VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [orderId, order.title])
            .then((id) => {})
        // TODO: print that this path not exist something like this
            .catchError((e) => e);
      },)
        .then((db) => db.close())
    // TODO: print that this path not exist something like this
        .catchError((e) => e);
  }

  static List<Map> getOrders(String path) {
    List<Map> row = [];

    // create or open the database
    openDatabase(
      path,
      onOpen: (db) {
        // Get the record
        db.rawQuery('SELECT * FROM Orders')
            .then((list) => row = list)
        // TODO: print that this user not exist or something like this
            .catchError((e) => e);
      },)
        .then((db) => db.close())
    // TODO: print that there is no data or something like this
        .catchError((e) => e);

    return row;
  }

  static void insertUser(String userId, User user, String path, {int version = 1}) {
    // create or open the database
    openDatabase(
      path, version: 1,
      onCreate: (db, version) {
        // When creating the db, create the table
        db.execute(
            'CREATE TABLE Store('
                'id TEXT, '
                'image TEXT, '
                'storeName TEXT, '
                'storeLocation ?, '
                'userName TEXT, '
                'userPassword TEXT, '
                'userPhoneNumber TEXT, '
                ')'
        ).then((value) => {})
        // TODO: print that this path not exist something like this
            .catchError((e) => e);},

      onOpen: (db) {
        // When opening the db, insert new table
        db.rawInsert(
            'INSERT INTO Store('
                'id, image, storeName, storeLocation, userName, userPassword, userPhoneNumber) '
                'VALUES(?, ?, ?, ?, ?, ?, ?)',
            [userId, user.imgPath, user.storeName, user.storeLocation, user.userName, user.password, user.userPN]
        ).then((id) => {});
      },).then((db) => db.close())
    // TODO: print that this path not exist something like this
        .catchError((e) => e);
  }

  static void updateUser(String path , User user) {
    // create or open the database
    openDatabase(
        path,
        onOpen: (db) {
          // When opening the db, update new table
          db.rawUpdate(
              'UPDATE Store SET '
                  'image = ? '
                  'storeName = ? '
                  'storeLocation = ? '
                  'userName = ? '
                  'userPassword = ? '
                  'userPhoneNumber = ? '
                  'WHERE id = ?',
              [
                user.imgPath,
                user.storeName,
                user.storeLocation,
                user.userName,
                user.password,
                user.userPN,
                user.userId
              ]
          ).then((count) => {})
          // TODO: print that this user not exist or something like this
              .catchError((e) => e);
        }).then((db) => db.close())
    // TODO: print that there is no data or something like this
        .catchError((e) => e);
  }
}