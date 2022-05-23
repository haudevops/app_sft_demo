import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/scan_widget.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class PackPickPage extends StatefulWidget {
  const PackPickPage({Key? key}) : super(key: key);
  static const routeName = '/PackPickPage';

  @override
  State<PackPickPage> createState() => _PackPickPageState();
}

class _PackPickPageState extends State<PackPickPage> {
  final _focusNode = FocusNode();
  final _scanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'LẤY HÀNG',
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
