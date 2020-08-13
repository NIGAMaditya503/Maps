import 'package:flutter/material.dart';

void main() => runApp(MaterialApp());

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
