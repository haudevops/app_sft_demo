import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sft_project/util/widget/custom_snack_bar.dart';
import 'package:sft_project/util/widget/custom_snackbar/top_snack_bar.dart';
import 'package:sft_project/util/widget/loading_item.dart';

abstract class BaseBloc {
  final _loadingStreamController = BehaviorSubject<bool>();
  final _showMsgSuccessController = BehaviorSubject<String>();
  final _showMsgFailController = BehaviorSubject<String>();
  final _showSpeakController = BehaviorSubject<String>();
  final _isScanController = BehaviorSubject<bool>();

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  Stream<String> get msgSuccessStream => _showMsgSuccessController.stream;

  Stream<String> get msgFailStream => _showMsgFailController.stream;

  Stream<String> get showSpeakStream => _showSpeakController.stream;

  Stream<bool> get scanStream => _isScanController.stream;

  void dispose() {
    _loadingStreamController.close();
    _showMsgSuccessController.close();
    _showMsgFailController.close();
    _showSpeakController.close();
    _isScanController.close();
  }

  void callBackScan() {
    _isScanController.sink.add(true);
  }

  void showLoading() {
    _loadingStreamController.sink.add(true);
  }

  void hiddenLoading() {
    _loadingStreamController.sink.add(false);
  }

  void showMsgSuccess(String msg) {
    if (msg != null) {
      _showMsgSuccessController.sink.add(msg);
    }
  }

  void showMsgFail(String msg) {
    if (msg != null) {
      _showMsgFailController.sink.add(msg);
    }
  }

  void showSpeak(String msg) {
    if (msg != null) {
      _showSpeakController.sink.add(msg);
    }
  }

  bool isLoading() {
    return _loadingStreamController.value;
  }
}

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    this.child,
    this.bloc,
    this.userDispose = true,
  }) : super(key: key);

  final T? bloc;
  final Widget? child;
  final bool userDispose;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BaseBloc>(BuildContext context) {
    final provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BaseBloc>> {
  final _tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    initTTS();

    widget.bloc?.msgSuccessStream.listen((msg) {
      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: msg,
          ),
          displayDuration: const Duration(milliseconds: 1000));
    });
    widget.bloc?.msgFailStream.listen((msg) {
      showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: msg,
          ),
          displayDuration: const Duration(milliseconds: 1000));
    });

    widget.bloc?.showSpeakStream.listen(showSpeak);
  }

  Future showSpeak(String text) async {
    await _tts.speak(text);
  }

  Future initTTS() async {
    await _tts.setLanguage('vi');
    await _tts.setSpeechRate(1.2);
    await _tts.setPitch(1);
  }

  @override
  void dispose() {
    if (widget.userDispose) widget.bloc?.dispose();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child!,
        StreamBuilder<bool>(
            stream: widget.bloc?.loadingStream,
            initialData: false,
            builder: (context, snapshot) {
              return (snapshot.data!)
                  ? Center(
                      child: LoadingItemWidget(),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    );
            })
      ],
    );
  }
}
