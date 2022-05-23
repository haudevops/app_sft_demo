import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/scan_widget.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class GatheringGood extends StatefulWidget {
  const GatheringGood({Key? key}) : super(key: key);
  static const routeName = '/GatheringGood';

  @override
  State<GatheringGood> createState() => _GatheringGoodState();
}

class _GatheringGoodState extends State<GatheringGood> {
  final _focusNode = FocusNode();
  final _scanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'TẬP KẾT',
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
