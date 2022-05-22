import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class GatheringGood extends StatefulWidget {
  const GatheringGood({Key? key}) : super(key: key);
  static const routeName = '/GatheringGood';

  @override
  State<GatheringGood> createState() => _GatheringGoodState();
}

class _GatheringGoodState extends State<GatheringGood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'TẬP KẾT',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
