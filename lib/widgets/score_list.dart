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

  int sayac = 0;

  @override
  void initState() {
    super.initState();
    liste = FootballApi.getData();  //her builde getData fonku calısmasın dıye initState icınde yazdım, sayfa acılırken bır kere veri alınacak
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: liste,  //veriyi buraya koyarım
      builder: (context, snapshot) {
        if (snapshot.hasData) { //veri geldıyse
          var liste = snapshot.data;  //snapshottan veriyi cıkardım
          if(sayac == 0){  //boylece her buildde ligleri ayirda hataya dusmeyecek,sadece ilk acıldıgında ligleri ayiracak
            DataService.ligleriAyir(liste);
            sayac ++;
          }
          return ListView.builder(
            itemCount: DataService.sonListe.length,
            itemBuilder: (context, index) {
              var anlikLig = DataService.sonListe[index];
              return ScoreListItem(gelenLig: anlikLig);
            },
          );
        } else if (snapshot.hasError) { //hata geldiyse
          return Center(child: Text(snapshot.error.toString()));
        } else { // veri gelene kadar
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

   
}
