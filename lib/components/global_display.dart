import 'package:covid_19_statistics_app/components/all_stats.dart';
import 'package:covid_19_statistics_app/components/input_card.dart';
import 'package:covid_19_statistics_app/constants.dart';
import 'package:covid_19_statistics_app/models/stat.dart';
import 'package:flutter/material.dart';

class GlobalDisplay extends StatelessWidget {
  final Stat stat;

  GlobalDisplay({this.stat});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        AllStats(
          stat: stat,
        )
      ],
    );
  }
}
