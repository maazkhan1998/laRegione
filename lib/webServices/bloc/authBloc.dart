import 'dart:async';

import '../../networking/api_response.dart';
import '../models/loginModel.dart';
import '../repositories/AuthRepository.dart';

class AuthBloc {
  AuthRepository _authRepository;

  StreamController _loginController;

  StreamSink<ApiResponse<LoginResponse>> get loginSink => _loginController.sink;

  Stream<ApiResponse<LoginResponse>> get loginStream => _loginController.stream;

  AuthBloc() {
    _loginController = StreamController<ApiResponse<LoginResponse>>.broadcast();
    _authRepository = AuthRepository();
  }

  loginUser(String email, String password) async {
    loginSink.add(ApiResponse.loading('Logging In'));
    try {
      LoginResponse user = await _authRepository.userLogin(email, password);
      if (user == null)
        loginSink.add(ApiResponse.error('error'));
      else {
        loginSink.add(ApiResponse.completed(user));
      }
    } catch (e) {
      loginSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _loginController?.close();
  }
}
