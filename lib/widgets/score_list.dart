import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';
import 'package:futskor/services/data_service.dart';
import 'package:futskor/services/football_api.dart';
import 'package:futskor/widgets/score_list_item.dart';

class ScoreList extends StatefulWidget {
  const ScoreList({super.key});

  @override
  State<ScoreList> createState() => _ScoreListState();
}

class _ScoreListState extends State<ScoreList> {
  late final Future<List<MatchInfo>> liste;
  late final List<MatchInfo> sonListe;

  @override
  void initState() {
    super.initState();
    liste = FootballApi.getData();
    //DataService.ligleriAyir(liste as List<MatchInfo>);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: liste,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var liste = snapshot.data;
          DataService.ligleriAyir(liste);
          return ListView.builder(
            itemCount: DataService.sonListe.length,
            itemBuilder: (context, index) {
              var anlikLig = DataService.sonListe[index];
              return ScoreListItem(gelenLig: anlikLig);
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

   
}
