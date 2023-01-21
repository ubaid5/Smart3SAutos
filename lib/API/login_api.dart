import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:autos_dealership/constants.dart';
import 'package:autos_dealership/Models/login_model.dart';

class ApiLogin {
  Future<List<LoginModel>?> getLogin() async {
    try {
      var url = Uri.parse(Constants.baseUrl + LoginConstants.usersEndpoint);
      var response = await http.post(url);
      if (response.statusCode == 200) {
        List<LoginModel> _model =  loginModelFromJson(response.body) as List<LoginModel>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
