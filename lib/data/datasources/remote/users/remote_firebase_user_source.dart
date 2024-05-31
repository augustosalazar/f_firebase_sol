import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:loggy/loggy.dart';

import '../../../../domain/models/user.dart';
import 'i_remote_user_source.dart';

class RemoteFirebaseUserSource implements IRemoteUserSource {
  CollectionReference<Map<String, dynamic>> get database =>
      FirebaseFirestore.instance.collection("userList");

  @override
  Future<bool> addUser(User user) async {
    logInfo("Creating user in realTime");
    await database.add(user.toJson());
    return true;
  }

  @override
  Future<bool> deleteUser(String id) async {
    // TODO implement deleteUser using the id of the user as reference to find the doc

    return Future.value(true);
  }

  @override
  Future<bool> deleteUsers() async {
    // TODO implement deleteUsers, get all entries and delete them
    return Future.value(true);
  }

  @override
  Future<List<User>> getUsers() async {
    var users = await database.get();
    return users.docs
        .map((e) => User(
            id: e.id,
            firstName: e.data()['firstName'],
            lastName: e.data()['lastName'],
            email: e.data()['email']))
        .toList();
  }

  @override
  Future<bool> updateUser(User user) {
    // TODO implement updateUser using the id of the user as reference to find the doc
    return Future.value(true);
  }
}
