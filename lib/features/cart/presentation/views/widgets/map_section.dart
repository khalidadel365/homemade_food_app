import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:latlong2/latlong.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  @override
  void initState() {
    super.initState();
    fetchCurrentLocation();

  }
  LatLng? userPoint;

  Future<void> fetchCurrentLocation() async {
    // نطلب الإذن
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      // نجيب الأرقام
      Position position = await Geolocator.getCurrentPosition();

      // نملأ العلبة وننور الشاشة
      setState(() {
        userPoint = LatLng(position.latitude, position.longitude);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return userPoint == null
        ? const Center(child: CircularProgressIndicator(color: kPrimaryColor,))
        : Container(
      height: 200,
      margin: const EdgeInsets.all(0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FlutterMap(
              options: MapOptions(
                initialCenter: userPoint!,// جايب منطقة المعادي مثلا كلها
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.none,// يعني ممنوع الزووم، ممنوع اللمس، ممنوع اللف، وممنوع التحريك.
                ),
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                ),
                MarkerLayer(markers: [
                  Marker(
                      width: 80.0,
                      height: 80.0,
                      point: userPoint!,// الدبوس يشاور علي مكاني بالظبط
                      child: Icon(Icons.location_on))
                ])
              ])
      ),
    );
  }
}
