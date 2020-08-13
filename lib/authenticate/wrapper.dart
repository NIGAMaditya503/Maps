import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/ChoicePage.dart';
import 'package:flutterapp/Screens/tabs.dart';
import 'package:flutterapp/Services/user.dart';
import 'package:provider/provider.dart';
//import 'package:homepage/tabs.dart';

//import 'main.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of <User>(context);


   if (user == null){
     return HomePage1();
        }else {
     return HomePage();
   }
   }
  }

