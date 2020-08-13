import 'package:flutter/material.dart';
import 'package:flutterapp/Services/trip.dart';
import 'package:flutterapp/Services/trip.dart';

class tripTile extends StatelessWidget {

  final  trip;
  tripTile({this.trip});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.greenAccent,
          ),
          title: Text(trip.name),
        ),
      ),
    );
  }
}
