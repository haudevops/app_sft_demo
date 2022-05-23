import 'package:dio/dio.dart';
import 'package:sft_project/common/common.dart';
import 'package:sft_project/common/define_service_api.dart';

class OvAuthLoginApi {
  OvAuthLoginApi._internal() {
    // Add Header for Request Token
    // const _token = '5383722d2d28f22852d16e25c45a04dc5f657763';
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['content-type'] = Headers.formUrlEncodedContentType;
          // myOption.headers['authorization'] = 'Bearer $_token';
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
  static final OvAuthLoginApi instance = OvAuthLoginApi._internal();

  Dio get dio => _dio;
}
