import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class TransferTransportPage extends StatefulWidget {
  const TransferTransportPage({Key? key}) : super(key: key);
  static const routeName = '/TransferTransportPage';

  @override
  State<TransferTransportPage> createState() => _TransferTransportPageState();
}

class _TransferTransportPageState extends State<TransferTransportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'LUÂN CHUYỂN',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
