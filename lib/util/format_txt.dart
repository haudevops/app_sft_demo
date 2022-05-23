import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class FocusNodeCustom extends FocusNode {
  static const MethodChannel _channel = MethodChannel('WFT_CHANNEL');

  @override
  bool consumeKeyboardToken() {
    checkEmulator();
    return super.consumeKeyboardToken();
  }

  Future<void> checkEmulator() async {
    final result = await _channel.invokeMethod('checkEmulator');
    if (!result) {
      Future.delayed(const Duration(),
          () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    }
  }
}
