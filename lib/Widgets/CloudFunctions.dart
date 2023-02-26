import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctions {
  Future<dynamic> get_mood() async {
    HttpsCallable httpsCallable =
        FirebaseFunctions.instance.httpsCallable("moodswing-api");
    try {
      final res = await httpsCallable.call();
      return res.data;
    } catch (err) {
      print("HTTPS ERROR: ${err}");
    }
  }
}
