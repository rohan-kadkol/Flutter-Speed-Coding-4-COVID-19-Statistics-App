import 'package:covid_19_statistics_app/components/country_display.dart';
import 'package:covid_19_statistics_app/components/global_display.dart';
import 'package:covid_19_statistics_app/models/stat.dart';
import 'package:flutter/material.dart';

class GenericDisplay extends StatefulWidget {
  final int selectedIndex;
  final Function onCountryDisplaySubmitted;

  static Stat globalStat = Stat();
  static Stat countryStat = Stat();

  GenericDisplay(
      {this.selectedIndex, this.onCountryDisplaySubmitted});

  @override
  _GenericDisplayState createState() => _GenericDisplayState();
}

class _GenericDisplayState extends State<GenericDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex == 0) {
      return GlobalDisplay(
        stat: GenericDisplay.globalStat,
      );
    } else {
      return CountryDisplay(
        stat: GenericDisplay.countryStat,
        onSubmitted: widget.onCountryDisplaySubmitted,
      );
    }
  }
}
