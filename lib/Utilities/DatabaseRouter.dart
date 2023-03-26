import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mood_swing/Objects/FileTypes.dart';

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

  Future<String?> uploadFile(XFile? file, FileType encodingFormat) async
  {
    if(file != null) {
      String path = "Processing Data/file." + encodingFormat.getPostfix();
      TaskSnapshot snap = await FirebaseStorage.instance.ref(path).putData(await file.readAsBytes(),SettableMetadata(
        contentType: encodingFormat.getEncoding(),
      ));
      return snap.ref.fullPath;
    }
    return null;
  }
}
