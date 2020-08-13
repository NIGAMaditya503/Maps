import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MaterialApp());


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _LastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position){
    _LastMapPosition = position.target;
  }

  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite: MapType.normal;

    });
  }

  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_LastMapPosition.toString()),
          position: _LastMapPosition,
          infoWindow: InfoWindow(
            title: 'title',
            snippet: 'snippet',
          ),
          icon: BitmapDescriptor.defaultMarker
      ));
    });
  }


  Widget button(Function function, IconDataicon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.grey,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('TITLE'),
            backgroundColor: Colors.greenAccent,
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget>[
                      button(_onMapTypeButtonPressed, Icons.map),
                      SizedBox(height: 16.0,),
                      button(_onAddMarkerButtonPressed, Icons.add_location),


                    ],
                  ),
                ),
              )
            ],
          ),
        )

    );
  }
}
