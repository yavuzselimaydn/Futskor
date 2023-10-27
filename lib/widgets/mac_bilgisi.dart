import 'package:flutter/material.dart';
import 'package:futskor/constants/constants.dart';
import 'package:futskor/model/fixture_model.dart';
import 'package:futskor/services/data_service.dart';

class MacBilgisi extends StatelessWidget {
  final MatchInfo gelenMac;
  const MacBilgisi({required this.gelenMac, super.key});

  @override
  Widget build(BuildContext context) {
    var genislik = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: 35,
      child: Card(
          margin: const EdgeInsets.all(1),
          child: macDurumu(gelenMac, genislik)),
    );
  }

  Widget macDurumu(MatchInfo gelenMac, genislik) {
    switch (gelenMac.fixture!.status!.short!) {

      case "NS": //mac daha baslamadı
        var saat = DataService.saateCevirme(gelenMac.fixture!.timestamp!);
        if (saat.length < 5) {
          saat = "${saat}0";
        }
        return Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 40,
              child: Text(
                saat,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: (genislik / 2) - 65,
              child: Text(
                "${gelenMac.teams!.home!.name}",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 40,
              child: Text(
                "v",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                "${gelenMac.teams!.away!.name}",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      //ilk yari ,2.yari
      case "1H" || "HT" || "2H": 
        return Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 30,
              child: Text(
                gelenMac.fixture!.status!.short == "HT"
                    ? "IY"
                    : "${gelenMac.fixture!.status!.elapsed.toString()}'",
                textAlign: TextAlign.center,
                style: Constants.oynananMacStyle
              ),
            ),
            SizedBox(
              width: (genislik / 2) - 55,
              child: Text(
                "${gelenMac.teams!.home!.name}",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 40,
              child: Text(
                "${gelenMac.goals!.home} - ${gelenMac.goals!.away}",
                textAlign: TextAlign.center,
                style: Constants.oynananMacStyle,
              ),
            ),
            Expanded(
              child: Text(
                "${gelenMac.teams!.away!.name}",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );

      case "FT": //mac bitti
        return Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            const SizedBox(
              width: 30,
              child: Text(
                "MS",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: (genislik / 2) - 55,
              child: Text(
                "${gelenMac.teams!.home!.name}",
                textAlign: TextAlign.center,
                style: gelenMac.teams!.home!.winner ?? false
                    ? const TextStyle(fontWeight: FontWeight.bold)
                    : null,
              ),
            ),
            SizedBox(
              width: 40,
              child: Text(
                "${gelenMac.goals!.home} - ${gelenMac.goals!.away}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                "${gelenMac.teams!.away!.name}",
                textAlign: TextAlign.center,
                style: gelenMac.teams!.away!.winner ?? false
                    ? const TextStyle(fontWeight: FontWeight.bold)
                    : null,
              ),
            ),
          ],
        );

      default:
        return const Text("PT");
    }
  }
}
