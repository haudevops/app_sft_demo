import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/scan_widget.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class StowDirectPage extends StatefulWidget {
  const StowDirectPage({Key? key}) : super(key: key);
  static const routeName = '/StowDirectPage';

  @override
  State<StowDirectPage> createState() => _StowDirectPageState();
}

class _StowDirectPageState extends State<StowDirectPage> {
  final _focusNode = FocusNode();
  final _scanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'LƯU KHO',
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
