import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class StowPage extends StatefulWidget {
  const StowPage({Key? key}) : super(key: key);
  static const routeName = '/StowPage';

  @override
  State<StowPage> createState() => _StowPageState();
}

class _StowPageState extends State<StowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'ĐỊNH VỊ',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
