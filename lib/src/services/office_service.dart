import 'dart:convert';

import 'package:adomi_app/src/models/models.dart';
import 'package:adomi_app/src/utils/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OfficeService extends ChangeNotifier {
  final String _baseUrl = 'us-central1-adomi-dev.cloudfunctions.net';
  final String _authority = 'core/api/v1/branch-offices';
  final String _cityId = 'c1e4bcc9-eb84-4653-872c-e38f8de4bf79';
  final String _lat = '4.545367057195659';
  final String _lng = '-76.09435558319092';
  final String _coverageRadio = 'true';

  List<OfficeInfo> officesInfo = [];
  late OfficeInfo officceSelected;

  bool isloading = true;

  OfficeService() {
    loadOffices();
  }

  Future<List<OfficeInfo>?> loadOffices() async {
    isloading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, _authority);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'cityId': _cityId,
      'lat': _lat,
      'lgn': _lng,
      'coverage_radio': _coverageRadio,
    });

    //Decode response
    try {
      final Map<String, dynamic> decodeResp = json.decode(response.body);
      if (decodeResp["code"] == 200) {
        List<dynamic> officeInfoData = decodeResp["data"] as List;

        officesInfo =
            (officeInfoData).map((e) => OfficeInfo.fromMap(e)).toList();

        return officesInfo;
      }
    } catch (e) {
      // print('=========');
      // print(e);
      return [];
    }
  }
}
