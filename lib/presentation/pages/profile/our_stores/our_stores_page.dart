import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class OurStoresPage extends StatefulWidget {
  const OurStoresPage({super.key});

  @override
  State<OurStoresPage> createState() => _OurStoresPageState();
}

class _OurStoresPageState extends State<OurStoresPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final places = <PlacemarkMapObject>[
    PlacemarkMapObject(
      mapId: const MapObjectId('1'),
      point: const Point(
          latitude: 38.894818,
          longitude: 65.805318
      ),
      opacity: 1,
      icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('assets/images/location.png'),
              scale: 1
          )
      ),
      text: const PlacemarkText(
          text: 'Texnomart',
          style: PlacemarkTextStyle()
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _moveToCurrentLocation(38.894818, 65.805318);
  }

  Future<void> _moveToCurrentLocation(double lat, double lon) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: lat,
            longitude: lon,
          ),
          zoom: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
          onMapCreated: (controller) {
            mapControllerCompleter.complete(controller);

            setState(() {

            });
          },
          mapObjects: places
      ),
    );
  }
}