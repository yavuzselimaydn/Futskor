import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';

class DataService {

  //istedigim ligler icin map yapısı olusturdum
  static List<Map<String, List<MatchInfo>>> sonListe = [
    {"Avrupa Şampiyonasi - Elemeler": []},
    {"Hazırlık Maçları - Ülkeler": []},
    {"Hazırlık Maçları - Kulüpler": []},
    {"La Liga": []},
    {"Ligue 1": []},
    {"Bundesliga": []},
    {"Seria A": []},
    {"Pro Lig": []},
    {"Championship": []},
    {"Premier Lig": []},
    {"Süper Lig": []},
    {"TFF 1.Lig": []},
    {"UEFA - Şampiyonlar Ligi": []},
    {"UEFA - Konferans Ligi": []},
    {"UEFA - Avrupa Ligi": []},
  ];

  static void ligleriAyir(List<MatchInfo>? liste) {
    for (var item in liste!) {
      switch (item.league!.id) {
        case 960:
          sonListe[0]["Avrupa Şampiyonasi - Elemeler"]!.add(item);
          break;
        case 10:
          sonListe[1]["Hazırlık Maçları - Ülkeler"]!.add(item);
          break;
        case 667:
          sonListe[2]["Hazırlık Maçları - Kulüpler"]!.add(item);
          break;
        case 140:
          sonListe[3]["La Liga"]!.add(item);
          break;
        case 61:
          sonListe[4]["Ligue 1"]!.add(item);
          break;
        case 78:
          sonListe[5]["Bundesliga"]!.add(item);
          break;
        case 135:
          sonListe[6]["Seria A"]!.add(item);
          break;
        case 307:
          sonListe[7]["Pro Lig"]!.add(item);
          break;
        case 40:
          sonListe[8]["Championship"]!.add(item);
          break;
        case 39:
          sonListe[9]["Premier Lig"]!.add(item);
          break;
        case 203:
          sonListe[10]["Süper Lig"]!.add(item);
          break;
        case 204:
          sonListe[11]["TFF 1.Lig"]!.add(item);
          break;
        case 2:
          sonListe[12]["UEFA - Şampiyonlar Ligi"]!.add(item);
          break;
        case 848:
          sonListe[13]["UEFA - Konferans Ligi"]!.add(item);
          break;
        case 3:
          sonListe[14]["UEFA - Avrupa Ligi"]!.add(item);
          break;

        default:
      }
    }

    //mac olmayan ligleri listeden cıkar
    sonListe.removeWhere(
        (map) => map.values.first.isEmpty,  //removeWhere kosula uyan elemanları listeden kaldırır
      );
    debugPrint(sonListe.toString());
  }

  static String saateCevirme(int i) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      i * 1000,
      isUtc: true,
    );
    DateTime localDate = date.toLocal();
    DateTime turkeyDate = localDate.toLocal().add(const Duration(hours: 3));
    return "${turkeyDate.hour}:${turkeyDate.minute}";
  }


}
