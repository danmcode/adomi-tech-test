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

  final List<OfficeInfo> officesInfo = [];

  bool isloading = true;
  bool isSaving = false;

  OfficeService() {
    loadOffices();
  }

  Future loadOffices() async {
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

    print(response.body);
  }
}
