import 'dart:async';

import 'package:food/UI/shared/utils.dart';
import 'package:food/core/data/models/map_model.dart';
import 'package:food/core/services/base_controller.dart';
import 'package:food/core/utils/map_util.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'map_data.dart';

class MapController extends BaseController {
  MapController(this.currentLocation);

  late LocationData currentLocation;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  late CameraPosition currentPosition;

  RxSet<Marker> markers = <Marker>{}.obs;

  late LatLng selectedLocation;

  RxString streetName = ''.obs;

  @override
  void onInit() {
    currentPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.42796133580664,
          currentLocation.longitude ?? -122.085749655962),
      zoom: 14.4746,
    );
    selectedLocation = LatLng(currentLocation.latitude ?? 37.42796133580664,
        currentLocation.longitude ?? -122.08574965596);
    addAllMarkers();
    super.onInit();
  }

  List<MapModel> centers = [];

  void addAllMarkers() {
    mapData.forEach((element) {
      centers.add(MapModel.fromJson(element));
    });

    centers.forEach((element) {
      addMarker(
          position: LatLng(element.latitude ?? 0.0, element.longitude ?? 0.0),
          id: element.numeric.toString());
    });
  }

  void addMarker({
    required LatLng position,
    required String id,
    String? imageName,
    String? imageUrl,
  }) async {
    BitmapDescriptor markerIcon = imageName != null
        ? await MapUtil.getImageFromAsset(imageName: imageName)
        : imageUrl != null
            ? await MapUtil.getImageFromNetwork(imageUrl: imageUrl)
            : BitmapDescriptor.defaultMarker;

    markers.add(
        Marker(markerId: MarkerId(id), position: position, icon: markerIcon));
    getStreetName();
    update();
  }

  void getStreetName() async {
    runLoadingFutureFunction(
        function: locationService
            .getLocationInfo(
                showLoader: false,
                LocationData.fromMap({
                  'latitude': selectedLocation.latitude,
                  'longitude': selectedLocation.longitude
                }))
            .then((value) {
      streetName.value = value?.street ?? 'No Info Found';
      update();
    }));
  }
}
