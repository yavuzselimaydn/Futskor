import 'package:dio/dio.dart';
import 'package:futskor/model/fixture_model.dart';

class FootballApi {

  static const String url = "https://v3.football.api-sports.io/fixtures?date=2023-10-17";

  static Future<List<MatchInfo>> getData() async {
    List<MatchInfo> list = [];

    var headers = {
      'x-rapidapi-key': '902beaf0c4c3eef7ba8b4fa4b47a06d1',
      'x-rapidapi-host': 'v3.football.api-sports.io'
    };

    var response = await Dio().get(
      url,
      options: Options(
        headers: headers,
      ),

    );

    var fixList = response.data["response"] as List;

    if (response.statusCode == 200) {
      list = fixList.map((e) => MatchInfo.fromJson(e)).toList();
      return list;
    }

    //debugPrint(response.data["response"][2].toString());

    return list;
  }
}
