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
  late Future<List<MatchInfo>> liste;

  @override
  void initState() {
    super.initState();
    liste = FootballApi.getData(); //her builde getData fonku calısmasın dıye initState icınde yazdım.
  }

  Future<void> refresh() async {
    var veri = FootballApi.getData();
    await veri;
    liste = veri;
    setState(() {});
    debugPrint(FootballApi.tarih);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: FutureBuilder(
        future: liste,                    //veriyi buraya koyarım
        builder: (context, snapshot) {
          if (snapshot.hasData) {         //veri geldıyse
            var liste = snapshot.data;    //snapshottan veriyi cıkardım
            DataService.ligleriAyir(liste);
            return ListView.builder(
              itemCount: DataService.liste1.length,
              itemBuilder: (context, index) {
                var anlikLig = DataService.liste1[index];
                return ScoreListItem(gelenLig: anlikLig);
              },
            );
          } else if (snapshot.hasError) {  //hata geldiyse
            return Center(child: Text(snapshot.error.toString()));
          } else {                         // veri gelene kadar
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
