import 'package:covid_19_statistics_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCard extends StatefulWidget {
  final Function onSubmitted;
  final String country;

  InputCard({this.onSubmitted, this.country});

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  String country = '';
  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(
      text: widget.country
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: controller,
            decoration: kTextFieldDecoration,
            onChanged: (value) {
              country = value;
            },
            onSubmitted: (value) => widget.onSubmitted(value),
          ),
        ),
        SizedBox(
          width: kSmallMargin,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: Icon(Icons.forward),
            onPressed: () => widget.onSubmitted(country),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
