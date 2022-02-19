import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kika/components/color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.onPressed,
    this.buttonText,
    this.backgroundColor,
    this.strokeColor,
    this.textColor,
    this.textSize,
    this.buttonWidth,
    this.child,
    this.height,
    this.borderRadius,
    this.overlayColor,
  })  : assert(
          child != null || buttonText != null,
          'Button Text and child '
          'property are null',
        ),
        super(key: key);
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? backgroundColor;
  final Color? strokeColor;
  final Color? textColor;
  final double? textSize;
  final double? buttonWidth;
  final Widget? child;
  final Size? height;
  final double? borderRadius;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: overlayColor != null
              ? MaterialStateProperty.all(overlayColor)
              : null,
          backgroundColor: backgroundColor == null
              ? MaterialStateProperty.all(Colors.white)
              : MaterialStateProperty.all(backgroundColor!),
          foregroundColor: MaterialStateProperty.all(textColor ?? null),
          minimumSize: height != null
              ? MaterialStateProperty.all(height)
              : MaterialStateProperty.all(Size.fromHeight(50.h)),
          maximumSize:
              height != null ? MaterialStateProperty.all(height) : null,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: strokeColor == null
                  ? BorderSide.none
                  : BorderSide(
                      color: strokeColor!,
                    ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius?.r ?? 10.r),
              ),
            ),
          ),
        ),
        child: child ??
            Text(
              '$buttonText',
              style: TextStyle(
                fontSize: ScreenUtil().setWidth(textSize ?? 16.sp),
                fontWeight: (backgroundColor == null && strokeColor == null)
                    ? FontWeight.w400
                    : FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
