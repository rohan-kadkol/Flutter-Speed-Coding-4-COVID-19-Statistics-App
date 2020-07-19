import 'package:covid_19_statistics_app/components/stats_card.dart';
import 'package:covid_19_statistics_app/models/stat.dart';
import 'package:flutter/material.dart';

class AllStats extends StatelessWidget {
  final Stat stat;

  AllStats({this.stat});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StatsCard(
            title: 'Total Confirmed',
            number: stat.totalConfirmed
        ),
        StatsCard(
            title: 'New Confirmed',
            number: stat.newConfirmed
        ),
        StatsCard(
            title: 'Total Recovered',
            number: stat.totalRecovered
        ),
        StatsCard(
            title: 'New Recovered',
            number: stat.newRecovered
        ),
        StatsCard(
            title: 'Total Deaths',
            number: stat.totalDeaths
        ),
        StatsCard(
            title: 'New Deaths',
            number: stat.newDeaths
        ),
      ],
    );
  }
}
