import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sft_project/data/service/login_service/get_ov_auth_info_service.dart';
import 'package:sft_project/generated/l10n.dart';
import 'package:sft_project/model/login_model/ov_auth_info_login.dart';
import 'package:sft_project/util/materials/constant.dart';
import 'package:sft_project/util/prefs_util.dart';

class OvAuthLoginRepository {
  OvAuthLoginRepository({required GetOvAuthInfoService getOvAuthInfoService})
      : _getOvAuthInfoService = getOvAuthInfoService;

  final GetOvAuthInfoService _getOvAuthInfoService;

  Future<OvAuthInfoLogin> login(String username, String password) async {
    final _completer = Completer<OvAuthInfoLogin>();
    try {
      final response =
          await _getOvAuthInfoService.getOvAuthInfo(username, password);
      final getOvAuthInfo = OvAuthInfoLogin.fromJson(response.data);
      if (getOvAuthInfo != null && getOvAuthInfo.token != null) {
        saveSharedPreferences(getOvAuthInfo);
      }
      _completer.complete(getOvAuthInfo);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        _completer.completeError(S.current.connectTimeout);
      } else {
        _completer.completeError(S.current.default_message_error);
      }
    } catch (ex, stackTrace) {
      _completer.completeError(ex.toString());
    }
    return _completer.future;
  }

  void saveSharedPreferences(OvAuthInfoLogin ovAuthInfoLogin) {
    PrefsUtil.putString(SPrefCache.KEY_ACCESS_TOKEN, ovAuthInfoLogin.token!);
    PrefsUtil.putString(SPrefCache.SCOPE_INFO_USER, ovAuthInfoLogin.scope!);
    // Tạm Comment
    // SPref.instance.set(SPrefCache.PREFERRED_USERNAME_INFO_USER,
    //     ovAuthInfoLogin.ovAuthClientInfo.fullName ?? '');

    // Logger.share.username = ovAuthInfoLogin.ovAuthClientInfo.fullName;
    // Logger.share.scopeUser = ovAuthInfoLogin.scope;
    // Logger.share.token = ovAuthInfoLogin.token;
    //
    // Logger.action.username = ovAuthInfoLogin.ovAuthClientInfo.fullName;
    // Logger.action.scopeUser = ovAuthInfoLogin.scope;
    // Logger.action.token = ovAuthInfoLogin.token;
  }
}
