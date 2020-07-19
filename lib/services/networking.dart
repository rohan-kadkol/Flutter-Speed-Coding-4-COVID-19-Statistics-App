import 'dart:convert';

import 'package:covid_19_statistics_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  dynamic getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  static getGlobalCovid19Stats({Function onTry, Function onCatch}) async{
    NetworkHelper helper = NetworkHelper('$kApiUrl/summary');
    var data = await helper.getData();

    try {
      onTry(data['Global'], 0);
    } catch (e) {
      onCatch(e);
    }
  }

  static getCountryCovid19Stats(String country, {Function onTry, Function onCatch}) async {
    NetworkHelper helper = NetworkHelper('$kApiUrl/summary');
    var data = await helper.getData();

    try {
      var countries = data['Countries'];
      for (var c in countries) {
        String cName = c['Country'];
        if (country == cName) {
          onTry(c, 1);
          return;
        }
      }
      throw Exception('Could not find an object with the entered country');
    } catch (e) {
      onCatch(e);
    }
  }
}