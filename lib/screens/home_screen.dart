import 'package:covid_19_statistics_app/components/all_stats.dart';
import 'package:covid_19_statistics_app/components/country_display.dart';
import 'package:covid_19_statistics_app/components/generic_display.dart';
import 'package:covid_19_statistics_app/components/global_display.dart';
import 'package:covid_19_statistics_app/components/input_card.dart';
import 'package:covid_19_statistics_app/components/stats_card.dart';
import 'package:covid_19_statistics_app/constants.dart';
import 'package:covid_19_statistics_app/models/stat.dart';
import 'package:covid_19_statistics_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onTry(data, selectedIndex) {
    setState(() {
      if (selectedIndex == 0) {
        GenericDisplay.globalStat.totalConfirmed = data['TotalConfirmed'];
        GenericDisplay.globalStat.newConfirmed = data['NewConfirmed'];
        GenericDisplay.globalStat.totalRecovered = data['TotalRecovered'];
        GenericDisplay.globalStat.newRecovered = data['NewRecovered'];
        GenericDisplay.globalStat.totalDeaths = data['TotalDeaths'];
        GenericDisplay.globalStat.newDeaths = data['NewDeaths'];
      } else {
        GenericDisplay.countryStat.country = data['Country'];
        GenericDisplay.countryStat.totalConfirmed = data['TotalConfirmed'];
        GenericDisplay.countryStat.newConfirmed = data['NewConfirmed'];
        GenericDisplay.countryStat.totalRecovered = data['TotalRecovered'];
        GenericDisplay.countryStat.newRecovered = data['NewRecovered'];
        GenericDisplay.countryStat.totalDeaths = data['TotalDeaths'];
        GenericDisplay.countryStat.newDeaths = data['NewDeaths'];
      }
    });
  }

  void onCatch(e) {
    print('ERROR');
    print(e);
    Alert(context: context, title: 'Error downloading data').show();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkHelper.getGlobalCovid19Stats(onTry: onTry, onCatch: onCatch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Statistics'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(kSmallMargin),
        child: GenericDisplay(
          selectedIndex: _selectedIndex,
          onCountryDisplaySubmitted: (value) {
            NetworkHelper.getCountryCovid19Stats(value,
                onTry: onTry, onCatch: onCatch);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.public), title: Text('Global')),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              title: Text('Particular Country'))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.redAccent,
      ),
    );
  }
}
