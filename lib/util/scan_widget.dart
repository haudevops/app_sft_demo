import 'package:flutter/material.dart';
import 'package:sft_project/util/format_txt.dart';

import 'app_color.dart';
import 'screen_util.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget(
      {required this.hintText,
      required this.focusTextNode,
      required this.scanController,
      required this.onFieldSubmitted,
      this.focusNode,
      this.colorBackground,
      this.colorBorder,
      this.colorHint,
      this.onChanged,
      this.isLowerCase,
      this.isReadOnlyInput,
      this.keyboardType});

  final String hintText;
  final FocusNode? focusNode;
  final FocusNode focusTextNode;
  final TextEditingController scanController;
  final ValueChanged<String> onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final Color? colorBackground;
  final Color? colorBorder;
  final Color? colorHint;
  final bool? isLowerCase;
  final bool? isReadOnlyInput;
  final TextInputType? keyboardType;

  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().getAdapterSize(4),
            vertical: ScreenUtil.getInstance().getAdapterSize(8)),
        child: TextFormField(
            focusNode: widget.focusTextNode,
            autofocus: true,
            onChanged: widget.onChanged,
            controller: widget.scanController,
            onFieldSubmitted: widget.onFieldSubmitted,
            autocorrect: false,
            readOnly: widget.isReadOnlyInput ?? false,
            enableSuggestions: false,
            keyboardType: widget.keyboardType ?? TextInputType.visiblePassword,
            inputFormatters: (widget.isLowerCase == null || !widget.isLowerCase!)
                ? [UpperCaseTxt()]
                : [],
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.colorBackground ??
                  AppColor.textFieldFillBackgroundColor,
              hintStyle: TextStyle(
                  color: widget.colorHint ?? AppColor.textFieldHintTextColor,
                  fontSize: 17),
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: widget.colorBorder ??
                      AppColor.textFieldBorderFocusedColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColor.textFieldEnabledBorderColor,
                  width: 1,
                ),
              ),
            )));
  }
}
