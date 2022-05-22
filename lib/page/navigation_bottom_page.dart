import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:sft_project/page/gathering_good/gathering_good_page.dart';
import 'package:sft_project/page/home/home_page.dart';
import 'package:sft_project/page/setting/setting_page.dart';
import 'package:sft_project/routes/screen_argument.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/screen_util.dart';
import 'package:sft_project/util/widget/custom_snackbar/custom_snack_bar.dart';
import 'package:sft_project/util/widget/custom_snackbar/top_snack_bar.dart';
import 'package:sft_project/page/package_picking/package_picking_page.dart';
import 'package:sft_project/page/receiced/received_page.dart';
import 'package:sft_project/page/release_pallet/release_pallet_page.dart';
import 'package:sft_project/page/stow/stow_page.dart';
import 'package:sft_project/page/stow_direct/stow_direct_page.dart';
import 'package:sft_project/page/transfer_transport/transfer_transport_page.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key, required this.data}) : super(key: key);
  static const routeName = '/NavPage';
  final ScreenArguments data;

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;
  bool _isListening = false;

  // stt.SpeechToText _speech;
  SpeechToText _speech = SpeechToText();
  String _text = '';
  String lastError = '';
  String lastStatus = '';
  List<String> groupModules = [
    'ĐỊNH VỊ',
    'THAY ĐỔI ĐỊNH VỊ',
    'LUÂN CHUYỂN',
    'LẤY HÀNG',
    'LƯU KHO',
    'NHẬN HÀNG',
    'CÀI ĐẶT',
    'ĐĂNG XUẤT',
    'TRANG CHỦ'
  ];

  String? userName;
  String? password;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // void onListen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) {
  //         print('onError: $val');
  //         setState(() {
  //           _isListening = false;
  //         });
  //       },
  //     );
  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //       });
  //       _speech.listen(
  //         onResult: (val) {
  //           if (val.finalResult) {
  //             setState(() {
  //               _text = val.recognizedWords.toUpperCase();
  //               print('textToSpeech: $_text');
  //               _isListening = false;
  //               _checkTextVoice(context, _text);
  //             });
  //           }
  //         },
  //         localeId: 'vi',
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       _isListening = false;
  //     });
  //     _speech.stop();
  //   }
  // }

  void _showErrorMsg(BuildContext context, String moduleName) {
    showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: '$moduleName không có trong chức năng, vui lòng thử lại',
        ),
        displayDuration: const Duration(milliseconds: 1000));
  }

  void _checkTextVoice(BuildContext context, String moduleName) {
    try {
      var _isMatchModule = false;
      for (var i = 0; i < groupModules.length; i++) {
        print('$i - $moduleName - ${groupModules[i]}');
        if (moduleName == groupModules[i]) {
          _isMatchModule = moduleName == groupModules[i];
          break;
        }
      }
      print('_isMatchModule = $_isMatchModule');
      if (_isMatchModule) {
        _checkVoiceCommandToNavigate(moduleName);
        _speech.cancel();
        return;
      }
      _showErrorMsg(context, moduleName);
    } catch (err) {
      print('Error: $err');
      setState(() {
        _isListening = false;
      });
    }
  }

  void _checkVoiceCommandToNavigate(String text) {
    switch (text) {
      case 'ĐỊNH VỊ':
        Navigator.pushNamed(context, StowPage.routeName);
        break;
      case 'THAY ĐỔI ĐỊNH VỊ':
        Navigator.pushNamed(context, ReleasedPalletPage.routeName);
        break;
      case 'LUÂN CHUYỂN':
        Navigator.pushNamed(context, TransferTransportPage.routeName);
        break;
      case 'LƯU KHO':
        Navigator.pushNamed(context, StowDirectPage.routeName);
        break;
      case 'LẤY HÀNG':
        Navigator.pushNamed(context, PackPickPage.routeName);
        break;
      case 'NHẬN HÀNG':
        Navigator.pushNamed(context, ReceivedPage.routeName);
        break;
      case 'TẬP KẾT':
        Navigator.pushNamed(context, GatheringGood.routeName);
        break;
      case 'CÀI ĐẶT':
        Navigator.pushNamed(context, SettingPage.routeName);
        break;
      case 'TRANG CHỦ':
        Navigator.pushNamed(context, HomePage.routeName);
        break;
      case 'ĐĂNG XUẤT':
        Navigator.pushNamed(context, ReceivedPage.routeName);
        break;
      default:
        break;
    }
  }

  Future<void> _initSpeech() async {
    try {
      var hasSpeech = await _speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
      );
      if (!mounted) return;

      setState(() {
        _isListening = hasSpeech;
      });
    } catch (e) {
      setState(() {
        lastError = 'Speech recognition failed: ${e.toString()}';
        _isListening = false;
      });
    }
  }

  void errorListener(SpeechRecognitionError error) {
    print('Received error status: $error, listening: ${_speech.isListening}');
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    print(
        'Received listener status: $status, listening: ${_speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  void _startListening() async {
    _speech.listen(
        onResult: _onSpeechResult,
        pauseFor: Duration(seconds: 2),
        partialResults: true,
        localeId: 'vi',
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      if (result.finalResult) {
        _text = result.recognizedWords.toUpperCase();
        print('textToSpeech: $_text');
        _checkTextVoice(context, _text);
        _isListening = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _speech = stt.SpeechToText();
    _initSpeech();
    userName = widget.data.arg1;
    password = widget.data.arg2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigateToScreen(_currentIndex),
      bottomNavigationBar: Container(
        height: ScreenUtil.getInstance().getAdapterSize(60),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: AppColor.colorBackgroundDrak,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0
                      ? AppColor.bottomNavigationSelectedColor
                      : AppColor.bottomNavigationDefaultColor,
                ),
                // ignore: deprecated_member_use
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: _currentIndex == 1
                      ? AppColor.bottomNavigationSelectedColor
                      : AppColor.bottomNavigationDefaultColor,
                ),
                // ignore: deprecated_member_use
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(5)),
        child: FloatingActionButton(
          onPressed: () =>
              _speech.isNotListening ? _startListening() : _stopListening(),
          backgroundColor: Colors.yellow[600],
          child: AvatarGlow(
            animate: !_speech.isNotListening,
            glowColor: AppColor.colorBlack,
            endRadius: ScreenUtil.getInstance().getAdapterSize(170),
            duration: const Duration(seconds: 1),
            repeatPauseDuration: const Duration(microseconds: 200),
            repeat: true,
            child: Icon(
              _speech.isNotListening ? Icons.mic : Icons.mic_none,
              size: ScreenUtil.getInstance().getAdapterSize(18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigateToScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SettingPage(
          data: ScreenArguments(arg1: userName, arg2: password),
        );
      default:
        return HomePage();
    }
  }
}
