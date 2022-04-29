import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vs_firstapp/custom_theme.dart';
import 'package:vs_firstapp/models/user_model.dart';

class UserMapAddress extends StatefulWidget {
  const UserMapAddress({Key? key}) : super(key: key);
  @override
  _UserMapAddressState createState() => _UserMapAddressState();
}

class _UserMapAddressState extends State<UserMapAddress> {

  UserModel user = Get.arguments['user'];
  double latitude = double.parse(Get.arguments['user'].address!.geo!.lat.toString());
  double longitude = double.parse(Get.arguments['user'].address!.geo!.lng.toString());
  final Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(user.address.zipcode.toString()),
          position: LatLng(latitude, longitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
              title: "Street: " + user.address.street.toString(),
              snippet: "Suite: " + user.address.suite.toString(),
              onTap: () {
                print("bye");
              }
          ),
        ),
      );
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.address.city.toString()),
          backgroundColor: CustomTheme.green700,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: _markers,
              mapType: _currentMapType,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 11.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget> [
                  FloatingActionButton(
                    heroTag: "mapType",
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: CustomTheme.green,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
