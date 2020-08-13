//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'dart:math';
import 'package:logger/logger.dart';
import 'package:geocoder/geocoder.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  static LatLng _initialPosition;

  //final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;
  List<Placemark> placemark;

  List<Marker> allMarkers = new List<Marker>();

  LatLng _center;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};


  Position currentLocation;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
//    allMarkers.add(Marker(
//        markerId: MarkerId('MyMarker'),
//       draggable: false;
//        onTap: () {
//          print('markerId');
//        },
//        position: _center
//    ));

    getUserLocation();
  }


  Future<Position>

  locateUser() {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    print('currentLocation  $currentLocation');
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);




      //      Marker marker= Marker(
//        markerId: MarkerId('mymarker'),
//        position: _center,
//        infoWindow: InfoWindow(
//          title: ' title' + placemark[0].locality,
//          snippet: '5 Star Rating',
//        ),
//        icon: BitmapDescriptor.defaultMarker,
//      );
//      allMarkers.add(marker);
    });
    print('center "Center:" $_center');
  }

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    Geolocator().placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  String _address = ""; // create this variable


  Placemark _getLocation(LatLng latLng) {
//    Position position = await Geolocator().getCurrentPosition(
//        desiredAccuracy: LocationAccuracy.high);
//    debugPrint('location: ${position.latitude}');

    final coordinates = new Coordinates(
        latLng.latitude, latLng.longitude);
    var addresses = Geocoder.local.findAddressesFromCoordinates(
        coordinates);

    // var first = addresses.first;
    List<Placemark> placemark = Geolocator().placemarkFromCoordinates(latLng.latitude, latLng.longitude) as List<Placemark>;
    Placemark placeMark  = placemark[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);

    setState(() {
      _address = address; // update _address
    });

    // markers have to be iterated (for loop has to be made in the
    // array allMarkers) and place these markers in the placemarks list and then return the list

  }


  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

//+  final ArgumentCallback<LatLng>


  void _onAddMarkerButtonPressed() {
    var rng = new Random();
    final MarkerId markerId = MarkerId(rng.toString());
   // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        currentLocation.latitude, currentLocation.longitude

      ),
      infoWindow: InfoWindow(title: 'markerIdVal', snippet: '*'),
      onTap: () {
//        _onMarkerTapped(markerId);
      },
    );


    setState(() {
      markers[markerId] = marker;
//      allMarkers.add(Marker(
//        markerId: MarkerId('mymarker'),
//        position: _center,
//        infoWindow: InfoWindow(
//          title: ' title' + placemark[0].locality,
//          snippet: '5 Star Rating',
//        ),
//        icon: BitmapDescriptor.defaultMarker,
//      ));
    });
  }




  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    LatLng _lastMapPosition = _center;

    void _onCameraMove(CameraPosition position) {
      _lastMapPosition = position.target;
    }
    print(_center);
    print(MarkerId);
    print(_lastMapPosition.latitude);
    print(_lastMapPosition.longitude);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(children: <Widget>[
          GoogleMap(
            //markers: Set.from(allMarkers),
            markers: Set<Marker>.of(markers.values),
            onCameraMove: _onCameraMove,
            onMapCreated: _onMapCreated,





            onLongPress: (LatLng latLng) {
              // creating a new MARKER
              var logger = Logger();
              logger.i('pressed Location', latLng.latitude.toString());
              Marker(
                  onTap: () {
                    print(''+ _getLocation(latLng).locality.toString());
                    },
                  draggable: true,
                  markerId: MarkerId('Marker'),
                  position: LatLng(_lastMapPosition.latitude, _lastMapPosition.longitude),
                  onDragEnd: ((_lastMapPosition) {
                    print(_lastMapPosition.latitude);
                    print(_lastMapPosition.longitude);
                  }));

              var markerIdVal = markers.length + 1;
              String mar = markerIdVal.toString();
              final MarkerId markerId = MarkerId(mar);
              final Marker marker = Marker(markerId: markerId, position: latLng, infoWindow: InfoWindow(title: 'Latitude'+ latLng.latitude.toString() +'Longitude'+ ''));
               setState(() {
                markers[markerId] = marker;
              });
            },


            initialCameraPosition: CameraPosition(
              target:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 15.0,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      mapButton(_onAddMarkerButtonPressed,
                          Icon(Icons.add_location), Colors.blue),
                      mapButton(
                          _onMapTypeButtonPressed,
                          Icon(
                            IconData(0xf473,
                                fontFamily: CupertinoIcons.iconFont,
                                fontPackage: CupertinoIcons.iconFontPackage),
                          ),
                          Colors.green),
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
