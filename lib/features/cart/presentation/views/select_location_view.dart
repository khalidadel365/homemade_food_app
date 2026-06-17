import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:homemade_food_app/constants.dart';
import 'package:latlong2/latlong.dart';

class SelectLocationView extends StatefulWidget {
  final LatLng initialPosition;

  const SelectLocationView({super.key, required this.initialPosition});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  late LatLng centerPosition;
  final MapController _mapController = MapController();
  String pickedAddress = "Loading address...";

  @override
  void initState() {
    super.initState();
    centerPosition = widget.initialPosition;
    _getAddress(centerPosition);
  }

  Future<void> _getAddress(LatLng position) async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        geo.Placemark place = placemarks.first;
        setState(() {
          pickedAddress = "${place.street}, ${place.subLocality ?? place.locality ?? ''}, ${place.administrativeArea ?? ''}";
        });
      }
    } catch (e) {
      setState(() {
        pickedAddress = "Custom Location (${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)})";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Delivery Location', style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: centerPosition,
              initialZoom: 16.0,
              onPositionChanged: (camera, hasGesture) {
                if (hasGesture) {
                  centerPosition = camera.center;
                }
              },
              onMapEvent: (event) {
                if (event is MapEventMoveEnd) {
                  _getAddress(centerPosition);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
              ),
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Icon(Icons.location_on, color: Colors.red, size: 45),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.map, color: kPrimaryColor),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            pickedAddress,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          Navigator.pop(context, {
                            'address': pickedAddress,
                            'lat': centerPosition.latitude,
                            'lng': centerPosition.longitude,
                          });
                        },
                        child: const Text('Confirm Location', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}