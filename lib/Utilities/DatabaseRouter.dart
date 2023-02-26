import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseRouter {
  String uid = FirebaseAuth.instance.currentUser?.uid ?? "-1";

  void createUser(String username) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        'name' : username,
        'playlists': [],
        'linkedDevices' : [],
        'settings': {},
        'statistics' : {},
      },
    );
  }
}
