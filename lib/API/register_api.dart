import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:autos_dealership/constants.dart';
import 'package:autos_dealership/Models/register_model.dart';

class ApiRegister {
  Future<List<SignUpModel>?> getSignUp() async {
    try {
      var url = Uri.parse(Constants.baseUrl + RegisterConstants.usersEndpoint);
      var response = await http.post(url);
      if (response.statusCode == 200) {
        List<SignUpModel> _model =  signUpModelFromJson(response.body) as List<SignUpModel> ;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
