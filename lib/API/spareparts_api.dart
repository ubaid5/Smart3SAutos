import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:autos_dealership/constants.dart';
import 'package:autos_dealership/Models/spareparts_model.dart';

class ApiSpareparts {
  Future<List<SparePartModel >?> getSpareParts() async {
    try {
      var url = Uri.parse(Constants.baseUrl + SparePartsConstants.usersEndpoint);
      var response = await http.post(url);
      if (response.statusCode == 200) {
        List<SparePartModel > _model =  sparePartModelFromJson(response.body) as List<SparePartModel>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
