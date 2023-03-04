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
      //Temporary logic to sanitize the JSON response
      String jsonifyResponse =
          response.body.substring(1, response.body.length - 1);
      jsonifyResponse = jsonifyResponse.replaceAll("'", "\"");
      Map<String, dynamic> resBody = jsonDecode(jsonifyResponse);

      //Aggregate the moods to find the maximum value
      Mood m = Mood.values
          .where((element) =>
              element.name.toLowerCase() ==
              resBody.entries
                  .reduce((value, element2) =>
                      value.value >= element2.value ? value : element2)
                  .key)
          .first;
      print(m.name);
    }
  }
}
