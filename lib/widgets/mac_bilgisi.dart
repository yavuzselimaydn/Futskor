import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';
import 'package:futskor/services/data_service.dart';

class MacBilgisi extends StatelessWidget {
  final MatchInfo gelenMac;
  const MacBilgisi({required this.gelenMac,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 35,
          child: Card(
            margin: const EdgeInsets.all(1),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                macDurumu(gelenMac),
                const SizedBox(
                  width: 10,
                ),
                Text("${gelenMac.teams!.home!.name}  -  ${gelenMac.teams!.away!.name}"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        );
  }

  macDurumu(gelenFixture) {
  switch (gelenFixture.fixture!.status!.short!) {
    case "NS":
      var saat = DataService.saateCevirme(gelenFixture.fixture!.timestamp!);
      if(saat.length <5){
        saat = "${saat}0";
      }
      return Text(saat.toString());
    case "1H":
      return Text(
        "${gelenFixture.fixture!.status!.elapsed.toString()}'",
        style: const TextStyle(color: Colors.red),
      );

    case "2H":
      return Text(
        "${gelenFixture.fixture!.status!.elapsed.toString()}'",
        style: const TextStyle(color: Colors.red),
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

  
}