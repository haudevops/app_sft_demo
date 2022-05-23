import 'package:dio/dio.dart';
import 'package:sft_project/common/define_service_api.dart';
import 'package:sft_project/data/network/login_identity_api.dart';

class GetInfoUserService {
  Future<Response> getInfoUser(String token) {
    print("Request Get Info User with API: URI: '${LoginIdentityApi.options.baseUrl + API_GET_USER_INFO_URN}' - $token");
    LoginIdentityApi.options.headers['Authorization'] = 'Bearer $token';
    
    return LoginIdentityApi.instance.dio.post(
      API_GET_USER_INFO_URN,
    );
  }
}
