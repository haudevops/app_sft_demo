
import 'package:sft_project/common/define_field.dart';

import 'ov_auth_client_info.dart';

class OvAuthInfoLogin {
  OvAuthInfoLogin({
    this.token,
    this.expiresIn,
    this.scope,
    this.ovAuthClientInfo,
    this.message,
  });

  factory OvAuthInfoLogin.fromJson(Map<String, dynamic> map) {
    return OvAuthInfoLogin(
      token: map[TOKEN_AUTH_FIELD],
      expiresIn: map[EXPIRES_AT_AUTH_FIELD],
      scope: map[SCOPE_FIELD],
      ovAuthClientInfo: map[CLIENT_INFO_FIELD] != null ? OvAuthClientInfo.fromJson(map[CLIENT_INFO_FIELD]) : null,
      message: map[MESSAGE_FIELD],
    );
  }

  String? token;
  String? expiresIn;
  String? scope;
  OvAuthClientInfo? ovAuthClientInfo;
  String? message;
}
