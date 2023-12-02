import 'package:flutter/material.dart';
import 'package:futskor/constants/constants.dart';
import 'package:futskor/model/fixture_model.dart';
import 'package:futskor/widgets/mac_bilgisi.dart';

class ScoreListItem extends StatelessWidget {
  final Map<String, List<MatchInfo>> gelenLig;
  final List<Widget> cards = [];

  ScoreListItem({required this.gelenLig, super.key});

  @override
  Widget build(BuildContext context) {
    var maclar = gelenLig[gelenLig.keys.first]; // map yapısındaki valueleri aldım

    //ilk once lig ismini widget listesine ekledim
    cards.add(listeyeLigIsminiEkle(maclar, gelenLig),);
    //sonra  macları widget listesine ekledim
    for (var mac in maclar!) {
      cards.add(
        MacBilgisi(gelenMac: mac)
      );
    }

    return Column(
      children: [...cards],
    );
  }
}

Widget listeyeLigIsminiEkle(maclar, gelenLig) {
  return SizedBox(
    height: 40,
    child: Card(
      margin: const EdgeInsets.all(0),
      color: Colors.blueGrey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Image.network(
              maclar![0].league!.logo ?? "",
              fit: BoxFit.fitHeight,
              width: 30,
            ),
            Text(
              "   ${gelenLig.keys.first}",
              style: Constants.ligStyle,
            ),
          ],
        ),
      ),
    ),
  );
}
