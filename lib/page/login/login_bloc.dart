import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sft_project/base/bloc_base.dart';
import 'package:sft_project/data/repo/ov_auth_login_repository.dart';
import 'package:sft_project/generated/l10n.dart';

class LoginBloc extends BaseBloc {

  OvAuthLoginRepository? _ovAuthLoginRepository;

  final _userNameController = BehaviorSubject<String>();
  Stream<String> get userNameStream => _userNameController.stream;

  final _passwordController = BehaviorSubject<String>();
  Stream<String> get passwordStream => _passwordController.stream;

  Future<void> loginAction(String userName, String password) async {
    await _ovAuthLoginRepository?.login(userName.trim(), password.trim()).then((value) {
      if(value == null){
        showMsgFail(S.current.errorLogin);
        return;
      }
      if(value.message != null){
        showMsgFail(value.message!);
      }else{
        showMsgSuccess('Đăng nhập thành công');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.close();
    _passwordController.close();
  }
}
