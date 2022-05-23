import 'package:sft_project/base/base_event.dart';
import 'package:sft_project/model/login_model/ov_auth_info_login.dart';

class LoginSuccessEvent extends BaseEvent {
  LoginSuccessEvent(this.infoLogin);
  final OvAuthInfoLogin infoLogin;
}
