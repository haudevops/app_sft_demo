import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/scan_widget.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class ReleasedPalletPage extends StatefulWidget {
  const ReleasedPalletPage({Key? key}) : super(key: key);
  static const routeName = '/ReleasePalletPage';

  @override
  State<ReleasedPalletPage> createState() => _ReleasedPalletPageState();
}

class _ReleasedPalletPageState extends State<ReleasedPalletPage> {
  final _focusNode = FocusNode();
  final _scanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'THAY ĐỔI DỊNH VỊ',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
      body: Column(
        children: [
          _scanWidget(),
        ],
      ),
    );
  }

  Widget _scanWidget() {
    return ScanWidget(
      hintText: 'Scan',
      focusTextNode: _focusNode,
      scanController: _scanController,
      colorBackground: AppColor.colorBackgroundDrak,
      onFieldSubmitted: (code) {
        if (code.isEmpty) {
          focusScan();
        } else {
          code.trim();
        }
      },
    );
  }

  void focusScan() {
    _scanController.clear();
    FocusScope.of(context).requestFocus(_focusNode);
  }
}
