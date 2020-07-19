import 'package:covid_19_statistics_app/components/all_stats.dart';
import 'package:covid_19_statistics_app/components/input_card.dart';
import 'package:covid_19_statistics_app/constants.dart';
import 'package:covid_19_statistics_app/models/stat.dart';
import 'package:flutter/material.dart';

class CountryDisplay extends StatelessWidget {
  final Stat stat;
  final Function onSubmitted;

  CountryDisplay({this.stat, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        InputCard(
          country: stat.country,
          onSubmitted: onSubmitted,
        ),
        SizedBox(
          height: kLargeMargin,
        ),
        AllStats(
          stat: stat,
        )
      ],
    );
  }
}
