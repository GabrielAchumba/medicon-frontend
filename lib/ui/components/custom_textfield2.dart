import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class CustomTextField2 extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? title;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool specialCase;
  final bool obscureText;
  final bool? autoFocus;
  final bool important;
  final bool busy;
  final bool enableCopy;
  final bool isRate;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField2({super.key, 
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.title,
    this.enabled,
    this.suffix,
    this.inputFormatters,
    this.specialCase = false,
    this.busy = false,
    this.important = false,
    this.enableCopy = true,
    this.isRate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: isRate ? AppColors.lightGrey : AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 16.h),
                  child: regularText(
                    title!,
                    fontSize: 13.sp,
                    color: isRate ? AppColors.black : AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          CupertinoTextField(
            enableInteractiveSelection: enableCopy,
            cursorColor: AppColors.black.withOpacity(0.4),
            cursorWidth: 1.h,
            focusNode: focusNode,
            maxLines: maxLines,
            enabled: enabled ?? true,
            maxLength: maxLength,
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(8.h),
              border: Border.all(
                  color: isRate ? AppColors.lightGrey : AppColors.white),
            ),
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style: GoogleFonts.rubik(color: AppColors.black, fontSize: 13.sp),
            readOnly: readOnly,
            suffix: suffix,
            obscureText: obscureText,
            onTap: onTap,
            obscuringCharacter: '●',
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: textInputType,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
