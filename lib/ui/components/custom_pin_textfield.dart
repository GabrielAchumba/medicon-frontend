import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
// import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pinput.dart';

class CustomPinTextField extends StatelessWidget {
  final String? title;
  final int maxLength;
  final TextEditingController controller;

  final Function(String?)? onDone;

  const CustomPinTextField({super.key, 
    this.title,
    this.onDone,
    required this.maxLength,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: regularText(
                  title!,
                  fontSize: 12.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
        Pinput(
          length: maxLength,
          onSubmitted: onDone,
          obscureText: true,
          controller: controller,
          onCompleted: onDone,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          followingPinTheme: PinTheme(
              height: 60.0,
              width: 60.0,
              textStyle:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.white,
                border: Border.all(
                    color: AppColors.green.withOpacity(.2), width: 1.h),
              )),
          focusedPinTheme: PinTheme(
              height: 60.0,
              width: 60.0,
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.green, width: 1.h))),
          submittedPinTheme: PinTheme(
              height: 60.0,
              width: 60.0,
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.white,
                  border: Border.all(color: AppColors.darkBlue, width: .5.h))),
        )
      ],
    );
  }
}
