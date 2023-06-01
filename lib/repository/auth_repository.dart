import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetwotkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppURL.loginApiEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppURL.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
