import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class UploadFileCard extends StatefulWidget {

  final VoidCallback onTap;

  const UploadFileCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _UploadFileCardState createState() => _UploadFileCardState();

}

class _UploadFileCardState extends State<UploadFileCard> {

  @override
  void didUpdateWidget(UploadFileCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: DottedBorder(
        color: AppColors.darkGreen,//color of dotted/dash line
        strokeWidth: .7.h, //thickness of dash/dots
        dashPattern: [10,6], 
        radius: Radius.circular(20.h),
        child: Container(
          alignment: Alignment.center,
          height: 200.h,
          //margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
            decoration: BoxDecoration(
              color:  AppColors.white,
            /*  borderRadius: BorderRadius.circular(20.h),
              border: Border.all(
                  width: .7.h,
                  color:  AppColors.darkGreen,
              ), */
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_outlined,
                  color: AppColors.darkGreen,
                  size: 40.h,
                ),
                SizedBox(height: 20.h),
                regularText(
                  'Browse and choose the file you want\n to upload from your computer',
                  fontSize: 13.sp,
                  color:  AppColors.textBlack,
                  fontWeight: FontWeight.w200,
                  textAlign: TextAlign.center
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 40.h,
                  width: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:  AppColors.darkGreen,
                  ),
                  child: Icon(
                    Icons.add,
                    color:  AppColors.white,
                    size: 30.h,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}