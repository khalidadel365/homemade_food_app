import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:latlong2/latlong.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    // لو الكيوبيت لسه معندوش إحداثيات (أول مرة يفتح الشاشة)، هنجيب اللوكيشن الحالي
    var cubit = context.read<CartCubit>();
    if (cubit.deliveryLatitude == 0.0) {
      fetchCurrentLocation();
    }
  }

  Future<void> fetchCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        String formattedAddress = "Current Location";
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          formattedAddress = "${place.street}, ${place.subLocality ?? place.locality ?? ''}";
        }

        if (!mounted) return;
        context.read<CartCubit>().updateOrderAddress(
          address: formattedAddress,
          lat: position.latitude,
          lng: position.longitude,
        );
      } catch (e) {
        if (!mounted) return;
        context.read<CartCubit>().updateOrderAddress(
          address: "Fetched Location",
          lat: position.latitude,
          lng: position.longitude,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<CartCubit>();

    if (cubit.deliveryLatitude == 0.0) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(color: kPrimaryColor),
        ),
      );
    }

    LatLng userPoint = LatLng(cubit.deliveryLatitude, cubit.deliveryLongitude);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(userPoint, 16.0);
    });

    return Container(
      height: 200,
      margin: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: userPoint,
            interactionOptions: const InteractionOptions(flags: InteractiveFlag.none), // ممنوع اللمس هنا
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
                point: userPoint,
                child: const Icon(Icons.location_on, color: Colors.red, size: 35),
              )
            ])
          ],
        ),
      ),
    );
  }
}