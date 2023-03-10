import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mood_swing/Objects/Mood.dart';

class APIRouter {

  Future<void> getUserMood() async {
    Response response = await http
        .get(Uri.parse(
            "https://moodswing-mood-classifier-ilvif34q5a-ue.a.run.app"))
        .timeout(Duration(minutes: 1));
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody = jsonDecode(response.body);

      //Aggregate the moods to find the maximum value
      Mood m = Mood.values
          .where((element) =>
              element.name.toLowerCase() ==
              resBody.entries
                  .reduce((value, element2) =>
              (double.tryParse(value.value)??0.0) >= (double.tryParse(element2.value)??0.0) ? value : element2)
                  .key)
          .first;
      print(m.name);
    }
  }
}