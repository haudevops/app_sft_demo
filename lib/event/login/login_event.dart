import 'package:sft_project/base/base_event.dart';

class LoginEvent extends BaseEvent {
  LoginEvent({
    required this.username,
    required this.password,
  });

  String username;
  String password;
}
