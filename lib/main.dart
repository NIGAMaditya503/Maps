import 'package:flutter/material.dart';
import 'package:flutterapp/Services/user.dart';
import 'package:flutterapp/authenticate/wrapper.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
         child: MaterialApp(
            home: wrapper(),
    ),
    );      
  }
}
