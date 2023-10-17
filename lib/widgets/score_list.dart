import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';
import 'package:futskor/services/football_api.dart';
import 'package:futskor/widgets/score_list_item.dart';

class ScoreList extends StatefulWidget {
  const ScoreList({super.key});

  @override
  State<ScoreList> createState() => _ScoreListState();
}

class _ScoreListState extends State<ScoreList> {
  late final Future<List<MatchInfo>> liste;

  @override
  void initState() {
    super.initState();
    liste = FootballApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: liste,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var liste = snapshot.data;
          return ListView.builder(
            itemCount: liste!.length,
            itemBuilder: (context, index) {
              var anlikElem = liste[index];
              return ScoreListItem(gelenFixture:anlikElem);
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
