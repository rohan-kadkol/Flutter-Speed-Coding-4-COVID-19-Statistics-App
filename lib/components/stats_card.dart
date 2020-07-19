import 'package:covid_19_statistics_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class StatsCard extends StatelessWidget {
  String title;
  int number;

  StatsCard({this.title, this.number});

  @override
  Widget build(BuildContext context) {
    final Display display = createDisplay(length: 20);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSmallMargin / 2),
      child: Card(
        color: Colors.red[100],
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: kSmallMargin, horizontal: kLargeMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(title, style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: kLargeMargin,
              ),
              Text(
                display(number),
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
