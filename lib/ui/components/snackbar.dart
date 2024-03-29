import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

void errorSnackBar(BuildContext context, String title, {int duration = 2}) {
  final Flushbar<void> flushBar = Flushbar<void>(
    title: title,
    titleText: Row(
      children: [
        Icon(
          Icons.error_outline_rounded,
          color: AppColors.btnRed,
          size: 22.h,
        ),
        const Spacer(),
        InkWell(
          //onTap: () => Navigator.pop(context),
          onTap: () => {},
          child: Icon(
            Icons.close,
            size: 20.h,
            color: AppColors.btnRed,
          ),
        )
      ],
    ),
    messageText: regularText(
      title,
      fontSize: 15.sp,
      color: AppColors.btnRed,
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(8.h),
    margin: EdgeInsets.all(16.h),
    borderColor: AppColors.btnRed,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration:  Duration(seconds: duration),
    backgroundColor: const Color(0xFFE3CDC6),
  );

  if (!flushBar.isShowing()) {
    flushBar.show(context);
  }
}

void successSnackBar(BuildContext context, String title) {
  final Flushbar<void> flushBar = Flushbar<void>(
    title: title,
    titleText: Row(
      children: [
        Image.asset(
          'assets/images/check-circle.png',
          width: 20.h,
          height: 20.h,
        ),
        const Spacer(),
        InkWell(
          //onTap: () => Navigator.pop(context),
          onTap: () => {},
          child: Icon(
            Icons.close,
            size: 20.h,
            color: AppColors.darkGreen,
          ),
        )
      ],
    ),
    messageText: regularText(
      title,
      fontSize: 15.sp,
      color: AppColors.darkGreen,
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(8.h),
    margin: EdgeInsets.all(16.h),
    borderColor: AppColors.darkGreen,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(seconds: 4),
    backgroundColor: const Color(0xffF6FEF9),
  );

  if (!flushBar.isShowing()) {
    flushBar.show(context);
  }
}
