import 'package:dio/dio.dart';
import 'package:sft_project/common/common.dart';
import 'package:sft_project/common/define_field.dart';
import 'package:sft_project/common/define_service_api.dart';
import 'package:sft_project/data/network/ov_auth_login_api.dart';

class GetOvAuthInfoService {
  Future<Response> getOvAuthInfo(String username, String password) {
    print("Request Get Token with API: URI: '${OvAuthLoginApi.options.baseUrl + API_GET_TOKEN_URN}', client_id: '$CLIENT_ID_OV_AUTH_CONFIG', client_secret: '$CLIENT_SECRET_OV_AUTH_CONFIG', grant_type: '$GRANT_TYPE_OV_AUTH_CONFIG', username: '$username', password: '$password'");
    return OvAuthLoginApi.instance.dio.post(
      API_GET_TOKEN_URN,
      data: {
        GRANT_TYPE_TOKEN_FIELD: GRANT_TYPE_OV_AUTH_CONFIG,
        USERNAME_TOKEN_FIELD: username,
        PASSWORD_TOKEN_FIELD: password,
        CLIENT_ID_TOKEN_FIELD: CLIENT_ID_OV_AUTH_CONFIG,
        CLIENT_SECRET_TOKEN_FIELD: CLIENT_SECRET_OV_AUTH_CONFIG,
      },
    );
  }
}
