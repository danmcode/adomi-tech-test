import 'package:adomi_app/src/models/models.dart';
import 'package:adomi_app/src/providers/providers.dart';
import 'package:adomi_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adomi_app/src/services/office_service.dart';

class ListPlacesScreen extends StatelessWidget {
  const ListPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final officesService = Provider.of<OfficeService>(context, listen: false);
    final uiProvider = Provider.of<UiProvider>(context, listen: false);

    List<OfficeInfo> officesList = officesService.officesInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: officesList.length,
            separatorBuilder: (_, __) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              final office = officesList[index];
              return ListTile(
                leading: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(office.brand!.logo),
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                title: Text(
                  office.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(office.address ?? ''),
                onTap: () {
                  uiProvider.selectedMenuOpt = 0;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
