import 'package:flutter/material.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/widget/app_bar_widget.dart';

class ReleasedPalletPage extends StatefulWidget {
  const ReleasedPalletPage({Key? key}) : super(key: key);
  static const routeName = '/ReleasePalletPage';

  @override
  State<ReleasedPalletPage> createState() => _ReleasedPalletPageState();
}

class _ReleasedPalletPageState extends State<ReleasedPalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'THAY ĐỔI DỊNH VỊ',
      ),
      backgroundColor: AppColor.colorBackgroundContainerDark,
    );
  }
}
