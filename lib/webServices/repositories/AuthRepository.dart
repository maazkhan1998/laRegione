import '../../networking/api_base_helper.dart';
import '../models/loginModel.dart';

import '../webServicesConstant.dart';

class AuthRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginResponse> userLogin(String email, String password) async {
    final response = await _helper.get(loginURL(email, password));
    return LoginResponse.fromJson(response);
  }
}
