import 'package:adomi_app/src/providers/providers.dart';
import 'package:adomi_app/src/screens/list_places_screen.dart';
import 'package:adomi_app/src/services/office_service.dart';
import 'package:adomi_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final officeService = Provider.of<OfficeService>(context);
    //Initial point
    const LatLng latLgnInitial = LatLng(4.545367057195659, -76.09435558319092);
    const CameraPosition initialPoint = CameraPosition(
      target: latLgnInitial,
      zoom: 15,
      tilt: 50,
    );

    //Markers
    Set<Marker> markers = <Marker>{};

    markers.add(
      const Marker(
        markerId: MarkerId('Geo-Location'),
        position: latLgnInitial,
      ),
    );

    return Scaffold(
      body: _HomeBody(initialPoint: initialPoint, markers: markers),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const MyUbication(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
    required this.initialPoint,
    required this.markers,
  }) : super(key: key);

  final CameraPosition initialPoint;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt con el provider
    final uiProvider = Provider.of<UiProvider>(context);
    int currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: initialPoint,
              markers: markers,
              onMapCreated: (GoogleMapController controller) {},
            ),
            const SearchPlace(),
          ],
        );
      case 1:
        return const ListPlacesScreen();
      default:
        return const HomeScreen();
    }
  }
}
