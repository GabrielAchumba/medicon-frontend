import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';

class AppointmentCard extends StatefulWidget {

  final String patientFullName;
  final String patientProfilePic;
  final String appointmentDate;
  final String appointmentTime;

  const AppointmentCard({
    Key? key,
    required this.patientFullName,
    required this.patientProfilePic,
    required this.appointmentDate,
    required this.appointmentTime
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
          color:  AppColors.darkGreen,
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
                            text: 'Pending appointment',
                            style: GoogleFonts.rubik(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w200,
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.h),
              decoration: BoxDecoration(
                color:  AppColors.white,
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