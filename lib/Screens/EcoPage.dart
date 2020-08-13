import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class EcoPage extends StatefulWidget{
  EcoPage({Key key, this.title}): super(key: key);
  final String title;
  @override
  _EcoPageState createState() => _EcoPageState();
}
class _EcoPageState extends State<EcoPage> {
  TextEditingController searchController = new TextEditingController();

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Text('Thank you for your contribution towards saving the environment'
              )
          ),
          SizedBox (height: 50.0,),

          Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector(
                onTap: (){},
                child: Center(
                    child : Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    )
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
