import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class UserTypeCard extends StatefulWidget {

  final String title;
  final String image;
  final Color textColor;
  final double height;
  final double width;
  final VoidCallback onTap;

  const UserTypeCard({
    Key? key,
    required this.title,
    required this.image,
    required this.textColor,
    required this.onTap,
    this.height = 200,
    this.width = 150,
  }) : super(key: key);

  @override
  _UserTypeCardState createState() => _UserTypeCardState();

}

class _UserTypeCardState extends State<UserTypeCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${widget.image}',
              height: 100.h,
              width: 100.h,
            ),
            SizedBox(height: 30.h),
            regularText(
              widget.title,
              fontSize: 15.sp,
              color: widget.textColor,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center
            ),
          ],
        ),
      ),
    );
  }
}