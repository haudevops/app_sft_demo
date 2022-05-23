import 'package:dio/dio.dart';
import 'package:sft_project/common/common.dart';
import 'package:sft_project/common/define_service_api.dart';

class LoginIdentityApi {
  LoginIdentityApi._internal() {
    // Add Header for Request Token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['content-type'] = 'application/x-www-form-urlencoded';
          return options.data;
        },
      ),
    );
  }

  static final Dio _dio = Dio(options);
  static final BaseOptions options = BaseOptions(
    baseUrl: indentityUrlGetToken,
    connectTimeout: CONNECT_TIMEOUT,
    receiveTimeout: RECEIVE_TIMEOUT,
  );
  static final LoginIdentityApi instance = LoginIdentityApi._internal();

  Dio get dio => _dio;
}
