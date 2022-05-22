import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:sft_project/page/navigation_bottom_page.dart';
import 'package:sft_project/routes/screen_argument.dart';
import 'package:sft_project/util/constants.dart';
import 'package:sft_project/util/screen_util.dart';

import '../../util/prefs_util.dart';

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/LoginPage';
  final ScreenArguments data;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  bool userHasTouchId = false;
  bool _useTouchId = false;
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _focusUserName = FocusNode();
  final _focusPassword = FocusNode();
  final _userNameKey = GlobalKey<FormState>();
  final _userPasswordKey = GlobalKey<FormState>();
  late bool _checkShowFaceID;
  var _userName;
  var _password;
  String? _userNameResponse;
  String? _passwordResponse;
  String _token = '';

  @override
  void initState() {
    super.initState();
    _checkShowFaceID = widget.data.arg1 ?? false;
    _userNameResponse = widget.data.arg2;
    _passwordResponse = widget.data.arg3;
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      authenticated = await auth.authenticate(
          localizedReason: 'Vui lòng quét khuôn mặt để mở khóa',
          useErrorDialogs: true,
          biometricOnly: true,
          stickyAuth: true,
          androidAuthStrings: AndroidAuthMessages(
            signInTitle: 'Mở khóa',
            biometricHint: '',
            cancelButton: 'Hủy',
          ));
      if (authenticated) {
        setState((){
          _userNameController.text = _userNameResponse ?? '';
          _passwordController.text = _passwordResponse ?? '';
        });
        print(
            'Login: \nuserName: ${_userNameController.text}\npassword: ${_passwordController.text}');
        checkLogin(_userNameController.text, _passwordController.text);
      }
      setState(() {
        _isAuthenticating = false;
        _checkShowFaceID = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> checkLogin(String userName, String password) async {
    if (userName.isNotEmpty && password.isNotEmpty) {
      _userName = PrefsUtil.putString(Constants.USER_NAME, userName);
      _password = PrefsUtil.putString(Constants.PASSWORD, password);
      _token = userName + password;
      print('Token: $_token');
      await PrefsUtil.putString(Constants.TOKEN, _token);
      Navigator.pushNamedAndRemoveUntil(
              context, NavPage.routeName, (Route<dynamic> route) => false,
              arguments: ScreenArguments(arg1: userName, arg2: password))
          .then((value) {
        setState(() {
          _checkShowFaceID = true;
          _userName = PrefsUtil.getString(Constants.USER_NAME);
          _password = PrefsUtil.getString(Constants.PASSWORD);
        });
        print('$_userName  $_password');
        _userNameController.clear();
        _passwordController.clear();
        FocusScope.of(context).requestFocus(_focusUserName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().getAdapterSize(8)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Chào mừng đến với SUPRA',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(20),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: ScreenUtil.getInstance().getAdapterSize(20)),
              Form(
                key: _userNameKey,
                child: TextFormField(
                  focusNode: _focusUserName,
                  autofocus: true,
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'Nhập tài khoản',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    if (_userNameKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(_focusPassword);
                    } else {
                      FocusScope.of(context).requestFocus(_focusUserName);
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Nhập tài khoản';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: ScreenUtil.getInstance().getAdapterSize(20)),
              Form(
                key: _userPasswordKey,
                child: TextFormField(
                  focusNode: _focusPassword,
                  autofocus: false,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Nhập mật khẩu',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Sai mật khẩu';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Center(
                child: Container(
                  width: ScreenUtil.getInstance().getAdapterSize(200),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_userNameKey.currentState!.validate() &&
                          _userPasswordKey.currentState!.validate()) {
                        checkLogin(
                            _userNameController.text, _passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 1,
                    ),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getAdapterSize(16),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _checkShowFaceID,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      print('OK');
                      _authenticateWithBiometrics();
                    },
                    icon: Icon(
                      Icons.tag_faces,
                      color: Colors.pinkAccent,
                      size: ScreenUtil.getInstance().getAdapterSize(35),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
