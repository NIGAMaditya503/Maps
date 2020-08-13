import'package:flutter/material.dart';


import 'Login.dart';
import 'Register.dart';



void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal,

  ),
  home: new HomePage(),
));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController= new TabController(length: 2, vsync: this);
  }
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //title: new Text('OnYva'),
        bottom: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              text: 'LOGIN',
              //icon: new Icon(Icons.account_box),
            ),
            new Tab(
              text: 'SIGNUP',
              //icon: new Icon(Icons.person),
            )
          ],

        ),
      ),


      body: new TabBarView(
        children: <Widget>[
          new LoginPage(),
          new RegisterPage(),

        ],
        controller: tabController,
      ),

    );
  }
}
