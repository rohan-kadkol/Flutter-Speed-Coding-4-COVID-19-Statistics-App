import 'package:flutter/material.dart';

const double kSmallMargin = 10;
const double kLargeMargin = 20;

const String kApiUrl = 'https://api.covid19api.com';

const InputDecoration kTextFieldDecoration = InputDecoration(
    hintText: 'Enter country name',
    icon: Icon(
      Icons.location_city,
      color: Colors.redAccent,
    ),
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
    disabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)));
