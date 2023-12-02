import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:futskor/constants/constants.dart';
import 'package:futskor/services/football_api.dart';
import 'package:futskor/widgets/score_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime birAyOncesi = DateTime(2023, suan.month.toInt() - 1);
    DateTime birAySonrasi = DateTime(2023, suan.month.toInt() + 1);

    return Scaffold(
      appBar: appbar(suan, birAyOncesi, birAySonrasi),
      body: ScoreList(),
    );
  }

  AppBar appbar(suan, birAySonrasi, birAyOncesi) {
    return AppBar(
      title: const Text(
        Constants.title,
        style: Constants.titleStyle,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            iconSize: 28,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: suan,
                firstDate: birAySonrasi,
                lastDate: birAyOncesi,
              ).then(
                (value) {
                    FootballApi.tarih = formatDate(value!, [yyyy, '-', mm, '-', dd]);
                    setState(() {
                      
                    });
                },
              );
            },
            icon: const Icon(Icons.calendar_month),
          ),
        )
      ],
    );
  }
}
