import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class GoogleMapExample extends StatefulWidget{
  @override
  _GoogleMapExample createState() => _GoogleMapExample();
}

class _GoogleMapExample extends State<GoogleMapExample> {
  final _key = GlobalKey<GoogleMapStateBase>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GoogleMap(
        key: _key,
        initialZoom: 12,
        initialPosition: GeoCoord(34, -118),
        mapType: MapType.roadmap,
        interactive: true,
        markers: {
          Marker(GeoCoord(34, -118))
        },
      )
    );
  }
}