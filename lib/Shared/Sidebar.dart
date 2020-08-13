import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

void main() => runApp(MyApp());

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
        children: <Widget>[
          DrawerHeader(child: Text('Here'),),
          ListTile(
            title: Text('Tile 1'),

          ),
          ListTile(
            title: Text('Tile 2'),

          ),
          ListTile(
            title: Text('Tile 3'),

          ),
          ListTile(
            title: Text('Tile 4'),

          )

        ],
        )
      );
  }
}
