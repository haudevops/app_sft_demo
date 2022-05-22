import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class ReceivedPage extends StatefulWidget {
  const ReceivedPage({Key? key}) : super(key: key);
  static const routeName = '/ReceivedPage';

  @override
  State<ReceivedPage> createState() => _ReceivedPageState();
}

class _ReceivedPageState extends State<ReceivedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'NHẬN HÀNG',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
