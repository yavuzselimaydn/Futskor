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
  int sayac = 0;


  @override
  void initState() {
    super.initState();
    liste = FootballApi.getData();  //her builde getData fonku calısmasın dıye initState icınde yazdım.
  }

  Future<void> _refresh() async {
      var veri = FootballApi.getData();
      await veri;
      liste = veri;
      setState(() {
        sayac = 0;
      });
      
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: FutureBuilder(
        //initialData: ["veri"],
        future:liste,  //veriyi buraya koyarım
        builder: (context, snapshot) {
          if (snapshot.hasData) { //veri geldıyse
            var liste = snapshot.data;  //snapshottan veriyi cıkardım
            if(sayac == 0 ){  //boylece her buildde ligleri ayirda hataya dusmeyecek,sadece ilk acıldıgında ligleri ayiracak
              DataService.ligleriAyir(liste);
              sayac ++;
            }

            return ListView.builder(
              itemCount: DataService.liste1.length,
              itemBuilder: (context, index) {
                var anlikLig = DataService.liste1[index];
                return ScoreListItem(gelenLig: anlikLig);
              },
            );
          } else if (snapshot.hasError) { //hata geldiyse
            return Center(child: Text(snapshot.error.toString()));
          } else {  // veri gelene kadar
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  
  


   
}
