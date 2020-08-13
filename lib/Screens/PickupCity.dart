import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/Services/trip.dart';
//import 'package:flutterapp/Shared/tripTile.dart';
import 'package:provider/provider.dart';

//import 'Accuratepickup.dart';



class CityPage extends StatefulWidget{
  CityPage({Key key, this.title}): super(key: key);
  final String title;
  @override
  _CityPageState createState() => _CityPageState();
}
class _CityPageState extends State<CityPage> {
  TextEditingController searchController = new TextEditingController();


  @override
  // ignore: missing_return
  Widget build(BuildContext context) {


    final trips = Provider.of<List<trip>>(context);

    trips.forEach((trip){
  
      print(trip.Pickup);
  
      print(trip.Dropoff);
  
      print(trip.Number_of_Seats);
});

    return Scaffold(
              resizeToAvoidBottomPadding: false,


              body: Column(
                  children: <Widget>[

                    SizedBox(height: 30.0,),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Card(
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: (){
                                        setState(() {
    //                                  Navigator.push(context, MaterialPageRoute(
    //                                      builder: ((context) => Accuratelocation())
    //                                  ));
                                        });
                                      },
                                      child: Icon(Icons.search),
                                    ),
                                    labelText: '  VILLE',
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            //Text("Results:" + filter())
                          ]
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      child: Text('ou'),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(

                            border: Border.all(
                                color: Colors.black38,
                                style: BorderStyle.solid,
                                width: 1.0

                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage('assets/Google.jpg')),
                              ),
                              Center(
                                child: Text('Détecter ma localisation',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    )),
                              )
                            ],
                          ),

                        )
                    )
                  ]

              ),



    );


  }
}

