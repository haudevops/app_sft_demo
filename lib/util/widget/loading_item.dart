import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sft_project/util/app_color.dart';

import 'scale_animation.dart';

class LoadingItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: AppColor.loadingBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SpinKitPouringHourglass(
          color: AppColor.loadingTextColor,
        ),
      ),
    );
  }
}
