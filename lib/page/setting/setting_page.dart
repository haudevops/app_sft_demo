import 'package:flutter/material.dart';
import 'package:sft_project/page/login/login_page.dart';
import 'package:sft_project/page/splash_screen/splash_screen_page.dart';
import 'package:sft_project/routes/screen_argument.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/constants.dart';
import 'package:sft_project/util/screen_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/SettingPage';
  final ScreenArguments data;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _checkFaceID = false;
  String? userName;
  String? password;


  void _checkBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(Constants.FACE_ID) != null) {
      setState(() {
        _checkFaceID = prefs.getBool(Constants.FACE_ID)!;
      });
    } else {
      setState(() {
        _checkFaceID = false;
      });
    }
    print('isFaceID: $_checkFaceID');
  }

  void _checkLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(_checkFaceID){
      print('out true');
      Navigator.pushNamed(context, LoginPage.routeName, arguments: ScreenArguments(arg1: _checkFaceID, arg2: userName, arg3: password));
    }else{
      print('out false');
      prefs.clear();
      Navigator.pushNamed(context, SplashScreenPage.routeName, arguments: ScreenArguments(arg1: null, arg2: null));
    }
  }


  @override
  void initState() {
    super.initState();
    userName = widget.data.arg1;
    password = widget.data.arg2;
    _checkBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBackgroundContainerDark,
      appBar: AppBar(
        title: Text('Cài đặt'),
        backgroundColor: AppColor.colorBackgroundCard,
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: Column(
        children: [
          _buildInfoUser(),
          _buildFaceID(),
          _buildLogout(),
        ],
      ),
    );
  }

  Widget _buildFaceID() {
    return Container(
      width: ScreenUtil.getInstance().screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.getInstance().getAdapterSize(8),
        vertical: ScreenUtil.getInstance().getAdapterSize(8),
      ),
      child: Card(
        color: AppColor.colorBackgroundCard,
        elevation: 4,
        child: Container(
          margin:
              const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: AppColor.iconBackgroundColor,
                  radius: 66,
                  child: Icon(
                    Icons.fingerprint,
                    color: AppColor.colorWhite,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'FaceID / Vân tay',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const Spacer(),
              Container(
                height: ScreenUtil.getInstance().getAdapterSize(30),
                width: ScreenUtil.getInstance().getAdapterSize(60),
                child: Switch(
                  value: _checkFaceID,
                  onChanged: (val) {
                    _tapSwitchFaceID(val);
                  },
                  activeColor: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapSwitchFaceID(bool val) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _checkFaceID = val;
      print('Toggle FaceID: $_checkFaceID');
      prefs.setBool(Constants.FACE_ID, _checkFaceID);
    });
  }

  Widget _buildInfoUser() {
    return Container(
      width: ScreenUtil.getInstance().screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil.getInstance().getAdapterSize(8),
        vertical: ScreenUtil.getInstance().getAdapterSize(8),
      ),
      child: Card(
        color: AppColor.colorBackgroundCard,
        elevation: 4,
        child: Container(
          margin:
              const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: AppColor.iconBackgroundColor,
                  radius: 66,
                  child: Icon(
                    Icons.person,
                    color: AppColor.colorWhite,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'DEV',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildLogout() {
    return GestureDetector(
      onTap: (){
        _checkLogout();
      },
      child: Container(
        width: ScreenUtil.getInstance().screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getAdapterSize(8),
          vertical: ScreenUtil.getInstance().getAdapterSize(8),
        ),
        child: Card(
          color: AppColor.colorBackgroundCard,
          elevation: 4,
          child: Container(
            margin:
                const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundColor: AppColor.iconBackgroundColor,
                    radius: 66,
                    child: Icon(
                      Icons.logout,
                      color: AppColor.colorWhite,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Đăng xuất',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
