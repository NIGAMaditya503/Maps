import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';
import 'package:flutterapp/Screens/RegisterDriver.dart';
import 'package:flutterapp/Screens/tabs.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/Services/data.dart';
import 'package:flutterapp/Services/trip.dart';
import 'package:flutterapp/Shared/Sidebar.dart';

import 'EcoPage.dart';
import 'PickupCity.dart';

import 'package:provider/provider.dart';


void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,

  ),
  home: new HomePage1(),
));


class HomePage1 extends StatefulWidget {

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController= new TabController(length: 3, vsync: this);
  }
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }


  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<trip>>.value(
      value: DatabaseService().trips,
        child: Scaffold(
          appBar: new AppBar(
            title:  Text('                 OnYva           '),


            actions: <Widget>[
             FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: ((context) => HomePage())
              ));

            },
          ),

        ],



            bottom: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              text: 'Share a Ride',
              //icon: new Icon(Icons.account_box),
            ),
            new Tab(
              text: 'Offer a ride',
              //icon: new Icon(Icons.person),
            ),
            new Tab(
              text: 'Eco-drive',
            )
          ],

        ),
      ),
           drawer: (
           new Drawer(
             child: new ListView(
               children: <Widget>[
                 new UserAccountsDrawerHeader(
                     accountName: new Text('Name'),
                     accountEmail: new Text('Email'),
                   currentAccountPicture: new GestureDetector(
                     child: new CircleAvatar(
                       backgroundImage: new NetworkImage('url'),
                     ),
                   ),
                   decoration: new BoxDecoration(
                   image: new DecorationImage(
                       image: new NetworkImage('')
                   )
                   ),

                 ),
                 new ListTile(
                   title: new Text('Page 1'),
                   trailing: new Icon(Icons.person),
                 ),
                 new Divider(),

               new ListTile(
               title: new Text('Page 2'),
          trailing: new Icon(Icons.home),
               ),
                 new Divider(),
        new ListTile(
    title: new Text('Page 3'),
    trailing: new Icon(Icons.directions_car),
        ),
        new Divider(),
        new ListTile(
        title: new Text('Page 4'),
    trailing: new Icon(Icons.info_outline),
        ),
    ],
             ),
           )
           ),


           body: new TabBarView(
            children: <Widget>[
      
          new CityPage(),
          new Registerdriver(),
          new EcoPage(),


        ],
        controller: tabController,
      ),

    )
    );
        
  }
}
