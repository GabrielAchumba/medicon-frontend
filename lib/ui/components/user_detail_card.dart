import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class UserDetailCard extends StatefulWidget {

  final String title;
  final Color iconColor;
  final IconData iconData;
  final VoidCallback onTap;
  final Color cardColor;
  final Color cardBorderColor;
  final bool isActive;
  final bool isPendingVerification;

  const UserDetailCard({
    Key? key,
    required this.title,
    required this.iconData,
    required this.iconColor,
    required this.cardColor,
    required this.cardBorderColor,
    required this.onTap,
    this.isActive = false,
    this.isPendingVerification = false,
  }) : super(key: key);

  @override
  _UserDetailCardState createState() => _UserDetailCardState();

}

class _UserDetailCardState extends State<UserDetailCard> {

  @override
  void didUpdateWidget(UserDetailCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
      height: 80.h,
      //margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
      decoration: BoxDecoration(
          color:  widget.isActive ? AppColors.darkGreen : AppColors.grey,
          borderRadius: BorderRadius.circular(20.h),
          border: Border.all(
              width: .7.h,
              color: widget.isActive ? AppColors.darkGreen : AppColors.textBlack,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              //margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
              //padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
              decoration: BoxDecoration(
                color: widget.isActive ? AppColors.white : AppColors.textBlack,
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: Icon(
                widget.iconData,
                color: widget.isActive ? AppColors.darkGreen : widget.iconColor,
                size: 30.h,
              ),
            ),
            SizedBox(width: 10.h),
            regularText(
              widget.title,
              fontSize: 15.sp,
              color: widget.isActive ? AppColors.white : AppColors.textBlack,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center
            ),
            SizedBox(width: 10.h),
            if(widget.isPendingVerification == true)
            Container(
              height: 40.h,
              width: 40.h,
              //margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
              //padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
              decoration: BoxDecoration(
                color:  widget.isActive ? AppColors.white :AppColors.darkGreen,
                borderRadius: BorderRadius.circular(20.h),
              ),
              child: Icon(
                Icons.check,
                color:  widget.isActive ? AppColors.darkGreen :AppColors.white,
                size: 30.h,
              ),
            ),
              /* Image.asset(
              'assets/images/check-circle.png',
              height: 40.h,
              width: 40.h,
              //color: widget.isActive ? AppColors.white : AppColors.textBlack,
            ) */
          ],
        ),
      ),
    );
  }
}