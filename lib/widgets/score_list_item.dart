import 'package:flutter/material.dart';
import 'package:futskor/model/fixture_model.dart';

class ScoreListItem extends StatelessWidget {
  final MatchInfo gelenFixture;
  const ScoreListItem({required this.gelenFixture,super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(
        children: [
          dk(),
          SizedBox(width: 10,),
          Text(gelenFixture.teams!.home!.name.toString())
          

        ],
      ),

    );
  }
  
  dk() {
    switch(gelenFixture.fixture!.status!.short!){
      case "NS":
        var saat = saateCevirme(gelenFixture.fixture!.timestamp!);
        return Text(saat.toString());
      case "1H":
        return Text("${gelenFixture.fixture!.status!.elapsed.toString()}'",style: TextStyle(color: Colors.red),);

      case "2H":
        return Text("${gelenFixture.fixture!.status!.elapsed.toString()}'",style: TextStyle(color: Colors.red),);
      case "FT":
        return const Text("MS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
      
      default:
       return const Text("PT");
    }

  }
  
  saateCevirme(int i) {
  /*DateTime date = DateTime.parse(dateStr);

  // Türkiye saat dilimine göre ayarlama yap
  DateTime localDate = date.toLocal();
  return "${localDate.hour}:${localDate.minute}";*/

  


    DateTime date = DateTime.fromMillisecondsSinceEpoch(i * 1000,isUtc:true,);
    DateTime localDate = date.toLocal();
    DateTime turkeyDate = localDate.toLocal().add(Duration(hours: 3));
    return "${turkeyDate.hour}:${turkeyDate.minute}";

  }

}