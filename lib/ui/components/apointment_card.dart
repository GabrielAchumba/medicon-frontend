import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class AppointmentCard extends StatefulWidget {

  final String patientFullName;
  final String patientProfilePic;
  final String appointmentDate;
  final String appointmentTime;
  final bool? isGallery;
  final String description;
  final String? appointmentNumber;

  const AppointmentCard({
    Key? key,
    required this.patientFullName,
    required this.patientProfilePic,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.description,
    this.isGallery = true,
    this.appointmentNumber = ""
  }) : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();

}

class _AppointmentCardState extends State<AppointmentCard> {

  @override
  void didUpdateWidget(AppointmentCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
         
        decoration: BoxDecoration(
          color:  widget.isGallery == true? AppColors.darkGreen : AppColors.white,
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Column(
          children:[
            Row(
              children: [
                CircleAvatar(
                  radius: 30.h,
                  backgroundImage: NetworkImage(
                      widget.patientProfilePic
                    ),
                ),
                SizedBox(width: 8.h),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: '${widget.patientFullName}\n',
                      style: GoogleFonts.rubik(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                            text: widget.description,
                            style: GoogleFonts.rubik(
                              color: widget.isGallery == true ? AppColors.white : AppColors.textBlack,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w200,
                        )),
                      ],
                    ),
                  ),
                ),
                Text(
                  widget.isGallery == false ? widget.appointmentNumber! : "",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.darkGreen,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
              decoration: BoxDecoration(
                color:  widget.isGallery == true? AppColors.white : AppColors.grey,
                borderRadius: BorderRadius.circular(30.h),
              ),
              child:Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: AppColors.darkGreen,
                    size: 30.h,
                  ),
                  SizedBox(width: 10.h),
                  Text(widget.appointmentDate,
                    style: TextStyle(
                      color: AppColors.textBlack

                    ),
                  ),
                  Expanded(child:Text('')),
                  Icon(
                    Icons.alarm,
                    color: AppColors.darkGreen,
                    size: 30.h,
                  ),
                  SizedBox(width: 10.h),
                  Text(widget.appointmentTime,
                    style: TextStyle(
                      color: AppColors.textBlack

                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}