import 'package:flutter/material.dart';
import 'package:sft_project/page/login/login_page.dart';
import 'package:sft_project/page/navigation_bottom_page.dart';
import 'package:sft_project/routes/screen_argument.dart';
import 'package:sft_project/util/constants.dart';
import 'package:sft_project/util/prefs_util.dart';
import 'package:sft_project/util/screen_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/SplashScreenPage';
  final ScreenArguments data;

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  String? _token;
  String? _userName;
  String? _password;

  void _checkTokenToNav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2), () {
      _token = prefs.getString(Constants.TOKEN);
      print('Token: ${_token.toString()}');
      if (_token != null && _token!.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, NavPage.routeName, (Route<dynamic> route) => false, arguments: ScreenArguments(arg1: _userName, arg2: _password));
      } else {
        prefs.clear();
        Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (Route<dynamic> route) => false,
            arguments: ScreenArguments(arg1: false, arg2: '', arg3: ''));
      }
    });

    // await Future.delayed(const Duration(seconds: 2), () {
    //   if (_userName != null && _password != null) {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, NavPage.routeName, (Route<dynamic> route) => false, arguments: ScreenArguments(arg1: _userName, arg2: _password));
    //   } else {
    //     Navigator.pushNamed(context, LoginPage.routeName,
    //         arguments: ScreenArguments(arg1: false, arg2: '', arg3: ''));
    //   }
    // });
  }

  void initState() {
    super.initState();
    _checkTokenToNav();

    _userName = widget.data.arg1;
    _password = widget.data.arg2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            'Supra'.toUpperCase(),
            style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil.getInstance().getAdapterSize(50)),
          ),
        ),
      ),
    );
  }
}
