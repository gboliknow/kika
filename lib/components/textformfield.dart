import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kika/components/color.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    Key? key,
    required this.title,
    this.titleSize,
    this.controller,
    this.hint,
    this.suffix,
    this.prefix,
    this.fillColor,
    this.hintStyle,
    this.width,
    this.filled = false,
    this.noBorder = true,
    this.maxLines,
    this.suffixIcon,
    this.keyboardType,
    this.style,
    this.maxLength,
  }) : super(key: key);
  final String? title;
  final double? titleSize;
  final String? hint;
  final double? width;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final bool filled;
  final int? maxLines;
  final bool? noBorder;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(titleSize ?? 14.sp),
            color: textColor,
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          cursorColor: Colors.black,
          style: style ?? TextStyle(color: Colors.black),
          maxLines: maxLines,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
            //   borderSide: BorderSide(color: bordercolor),
            // ),
            fillColor: fillColor,
            filled: filled,
            isDense: true,
            hintText: hint,
            suffix: suffix,
            suffixIcon: suffixIcon,
            prefix: prefix,

            hintStyle: hintStyle ??
                TextStyle(
                  color: borderColor,
                  fontSize: 15.sp,
                ),
            enabledBorder: filled
                ? InputBorder.none
                : OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    borderSide: BorderSide(
                      color: borderColor,
                    ),
                  ),
            focusedBorder: filled
                ? InputBorder.none
                : OutlineInputBorder(
                    gapPadding: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    borderSide: BorderSide(
                      color: HexColor('#001833'),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
