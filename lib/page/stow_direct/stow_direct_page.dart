import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class StowDirectPage extends StatefulWidget {
  const StowDirectPage({Key? key}) : super(key: key);
  static const routeName = '/StowDirectPage';

  @override
  State<StowDirectPage> createState() => _StowDirectPageState();
}

class _StowDirectPageState extends State<StowDirectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'LƯU KHO',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
