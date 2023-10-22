import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';

class ScoreListItem extends StatelessWidget {
  final Map<String, List<MatchInfo>> gelenLig;
  final List<Widget> cards = [];

  ScoreListItem({required this.gelenLig, super.key});

  @override
  Widget build(BuildContext context) {
    var maclar = gelenLig[gelenLig.keys.first];

    //lig ismi
    cards.add(SizedBox(
      height: 35,
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.blueGrey.shade200,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Image.network(
              maclar![0].league!.logo ?? "",
              fit: BoxFit.contain,
              width: 30,
            ),
            Text(
              "  -   ${gelenLig.keys.first}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));

    for (var mac in maclar) {
      cards.add(
        SizedBox(
          height: 35,
          child: Card(
            margin: const EdgeInsets.all(1),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                dk(mac),
                const SizedBox(
                  width: 10,
                ),
                Text(mac.teams!.home!.name.toString())
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [...cards],
    );
  }
}

dk(gelenFixture) {
  switch (gelenFixture.fixture!.status!.short!) {
    case "NS":
      var saat = saateCevirme(gelenFixture.fixture!.timestamp!);
      return Text(saat.toString());
    case "1H":
      return Text(
        "${gelenFixture.fixture!.status!.elapsed.toString()}'",
        style: TextStyle(color: Colors.red),
      );

    case "2H":
      return Text(
        "${gelenFixture.fixture!.status!.elapsed.toString()}'",
        style: TextStyle(color: Colors.red),
      );
    case "FT":
      return const Text(
        "MS",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );

    default:
      return const Text("PT");
  }
}

saateCevirme(int i) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
    i * 1000,
    isUtc: true,
  );
  DateTime localDate = date.toLocal();
  DateTime turkeyDate = localDate.toLocal().add(const Duration(hours: 3));
  return "${turkeyDate.hour}:${turkeyDate.minute}";
}
