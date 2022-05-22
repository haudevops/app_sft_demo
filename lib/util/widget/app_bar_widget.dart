import 'package:flutter/material.dart';
import 'package:sft_project/page/navigation_bottom_page.dart';
import 'package:sft_project/util/app_color.dart';
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {required this.title,
      this.onBack,
      this.actions,
      this.isVisibleBackButton = true,
      this.isVisibleHomeAction = true,
      this.color});

  final VoidCallback? onBack;
  final String title;
  final List<Widget>? actions;
  final bool isVisibleBackButton;
  final bool isVisibleHomeAction;
  final Color? color;

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(60);
  }
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: widget.color ?? AppColor.colorBackgroundDrak,
        title: Text(
          widget.title,
          style: TextStyle(
            color: AppColor.appBarTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: widget.isVisibleBackButton
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColor.appBarIconColor,
                ),
                onPressed: widget.onBack ??
                    () {
                      Navigator.pop(context);
                    },
              )
            : null,
        automaticallyImplyLeading: false,
        actions: widget.isVisibleHomeAction
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavPage.routeName, (route) => false);
                  },
                )
              ]
            : widget.actions);
  }
}
