import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';
import '../data/firebase.dart';
import '../data/local.dart';
import '../models/medication_models.dart';
import '../models/user_models.dart';

class MyPro extends ChangeNotifier {


  // models
  MedicationDates ordersDetails = MedicationDates();
  List<MedicationDates> ordersDetailsList = [];

  // firebase
  FirebaseManager firebaseManager = FirebaseManager();

  /////////////////////////////////////////////
  // methods
  /////////////////////////////////////////////

  // auth
  login(/*String email, String password*/) async {

    //firebaseManager.signInWithEmailAndPassword(email, password);

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('sign', 'true');
    notifyListeners();
  }

  signUp(User user, String path) async {

    String authId = await firebaseManager.createUserWithEmailAndPassword(user.email, user.password);

    String uid = await firebaseManager.createDocument("Users", User.toMap(user, authId));

    LocalData.insertUser(uid, user, path);

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('sign', 'true');
    notifyListeners();
  }

  getSavedSign(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String reJson = pref.getString('sign') ?? '';
    if(reJson == 'true') {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    notifyListeners();
  }

  logout() async {

    //firebaseManager.signOut();

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('sign', '');
  }

  ////////////////////////////////////////////
  // user
  updateUser(User user, String path) async {

    await firebaseManager.updateDocument(
        "Users", user.userId, User.toMap(user, user.userId));

    LocalData.updateUser(path, user);

    notifyListeners();
  }

  deleteUserTable(String path) async {

    LocalData.deleteTable(path, "Users");

    notifyListeners();
  }

  ////////////////////////////////////////////
  // orders
  addOrder(MedicationDates order, String path) async {

    String oid = await firebaseManager.createDocument(
        "Orders", MedicationDates.toMap(order)
    );

    LocalData.insertOrder(oid, order, path);
    notifyListeners();
  }

  getOrders(String orderId, String path) async {

    Map<String, dynamic> order = await firebaseManager.getDocument(
        "Orders", orderId
    );

    List<Map> orders = LocalData.getOrders(path);

    ordersDetails = MedicationDates.fromMap(order);

    notifyListeners();
  }

  getOrder(String orderId, String path) async {

    Map<String, dynamic> order = await firebaseManager.getDocument(
        "Orders", orderId
    );

    List<Map> orders = LocalData.getSpecificRecords(path, "orders", "id", orderId);

    ordersDetails = MedicationDates.fromMap(order);

    notifyListeners();
  }

  deleteOrder(MedicationDates order, String path) async {

    await firebaseManager.deleteDocument("Orders", order.dateId);

    LocalData.deleteRecord(path, order.dateId, "Orders");

    notifyListeners();
  }

  deleteOrderTable(String path) async {

    LocalData.deleteTable(path, "Orders");

    notifyListeners();
  }

}