import 'package:flutter/material.dart';
import 'package:futskor/constants/constants.dart';

import 'package:futskor/services/football_api.dart';
import 'package:futskor/widgets/score_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FootballApi.getData();
    return Scaffold(
      appBar: appbar(),
      body: const ScoreList(),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: const Text(Constants.title,style: Constants.titleStyle,),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month),)
      ],
    );
  }
}