import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:autos_dealership/constants.dart';
import 'package:autos_dealership/Models/service_model.dart';

class ApiService {
  Future<List<ServicesModel >?> getService() async {
    try {
      var url = Uri.parse(Constants.baseUrl + ServicesConstants.usersEndpoint);
      var response = await http.post(url);
      if (response.statusCode == 200) {
        List<ServicesModel > _model =  servicesModelFromJson(response.body) as List<ServicesModel> ;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
