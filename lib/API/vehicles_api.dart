import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:autos_dealership/constants.dart';
import 'package:autos_dealership/Models/vehicle_model.dart';

class ApiVehicles {
  Future<List<VehicleModel >?> getVehicles() async {
    var url = Uri.parse(Constants.baseUrl + VehiclesConstants.usersEndpoint);
    var response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      List<VehicleModel > _model =  vehicleModelFromJson(response.body) as List<VehicleModel>;
      return _model;
    }
    try {

    } catch (e) {
      log(e.toString());
    }
  }
}
