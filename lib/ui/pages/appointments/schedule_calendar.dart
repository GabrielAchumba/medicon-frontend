import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/custom_textfield2.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:medicon/services/apointment_services/appointment_service.dart';


class ScheduleCalendarScreen extends StatefulWidget {

  final String country;
  final String userType;

  const ScheduleCalendarScreen(this.country,
  this.userType,
  {super.key});
  @override
  _ScheduleCalendarScreenState createState() => _ScheduleCalendarScreenState();
}

class _ScheduleCalendarScreenState extends State<ScheduleCalendarScreen> {

  bool removeImage = true;
  bool removeBack = true;
  TextEditingController appointmentDate = TextEditingController();
  DateTime? pickedDate;
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentService>(
      builder: (context, appointmentService, child) {
        return CustomScaffold(
        title: '',
        removeBack: removeBack,
        removeImage: removeImage,
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            regularText(
              'Schedule Calendar',
              fontSize: 25.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w600,
              color: AppColors.black
            ),
            SizedBox(height: 10.h),
            regularText(
              'Schedule appointment with patients',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w300,
              color: AppColors.textBlack
            ),
            SizedBox(height: 20.h),
            regularText(
              'This is your appointment booking calendar. Kindly publish your dates and times for the benefit of your prospective patients.',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w300,
              color: AppColors.textBlack
            ),
            SizedBox(height: 20.h),
            regularText(
              'Date Range',
              fontSize: 14.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w600,
              color: AppColors.black
            ),
            SizedBox(height: 20.h),
            regularText(
              'You may select multiple dates from the calendar and set up multiple time slots each date',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              fontWeight:  FontWeight.w300,
              color: AppColors.textBlack
            ),
            SizedBox(height: 20.h),
            appointmentDate.text.isNotEmpty
                ? CustomTextField2(
                    title: 'Date of Appointment',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: appointmentDate,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          builder: (context, child) => Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: const ColorScheme.light(
                              onPrimary: AppColors.white, // selected text color
                              onSurface: AppColors.black, // default text color
                              primary: AppColors.darkGreen, // circle color
                              ),
                              dialogBackgroundColor: AppColors.white,
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    fontFamily: 'Quicksand'
                                  ),
                                ),
                              ),
                              
                            ),
                            child: child!,
                          ),
                      );

                      if (pickedDate != null) {
                        appointmentDate.text = pickedDate.toString().split(" ")[0];
                        await appointmentService.addApointment(appointmentDate.text,
                        pickedDate.day, pickedDate.month, pickedDate.year);
                      }
                      setState(() {});
                    },
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.h),
                          child: Icon(
                            Icons.calendar_today,
                            color: AppColors.grey,
                            size: 28.h,
                          ),
                        ),
                      ],
                    ),
                  )
              : CustomTextField(
              hintText: 'Date of Appointment',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: appointmentDate,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                          builder: (context, child) => Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: const ColorScheme.light(
                              onPrimary: AppColors.white, // selected text color
                              onSurface: AppColors.black, // default text color
                              primary: AppColors.darkGreen, // circle color
                              ),
                              dialogBackgroundColor: AppColors.white,
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    fontFamily: 'Quicksand'
                                  ),
                                ),
                              ),
                              
                            ),
                            child: child!,
                          ),
                  );

                if (pickedDate != null) {
                  appointmentDate.text = pickedDate.toString().split(" ")[0];
                }
                setState(() {});
              },
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.h),
                    child: Icon(
                      Icons.calendar_today,
                      color: AppColors.textBlack,
                      size: 28.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              itemCount: appointmentService.appointments!.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (ctx, appointmentIndex) {
                 return Column(
                   children: [
                    Row(
                      children: [
                        SizedBox(width: 10.h),
                        regularText(
                          'Time Range',
                          fontSize: 13.sp,
                          textAlign: TextAlign.start,
                          fontWeight:  FontWeight.w300,
                          color: AppColors.textBlack
                        ),
                        Expanded(
                          child: regularText(
                            '',
                            fontSize: 13.sp,
                            textAlign: TextAlign.start,
                            fontWeight:  FontWeight.w300,
                            color: AppColors.textBlack
                          ),
                        ),
                        regularText(
                          appointmentService.appointments![appointmentIndex].dateOfAppointment!,
                          fontSize: 13.sp,
                          textAlign: TextAlign.start,
                          fontWeight:  FontWeight.w300,
                          color: AppColors.textBlack
                        ),
                        SizedBox(width: 10.h),
                      ],
                    ),
                    ListView.builder(
                      itemCount: appointmentService.appointments![appointmentIndex].timeRange!.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (ctx, timeRangeIndex) {
                        return Row(
                          children: [
                            SizedBox(width: 10.h),
                            if(timeRangeIndex == 0)
                              Switch.adaptive(
                                // Don't use the ambient CupertinoThemeData to style this switch.
                                applyCupertinoTheme: false,
                                value: appointmentService.appointments![appointmentIndex].statusOfAppointment!,
                                onChanged: (bool value) {
                                  appointmentService.updateStatusOfAppointment(appointmentIndex, value);
                                },
                              ),
                            if(timeRangeIndex > 0)
                              Expanded(child: Text('')),
                            if(timeRangeIndex == 0)
                              regularText(
                                appointmentService.getDay2(appointmentIndex),
                                fontSize: 13.sp,
                                textAlign: TextAlign.start,
                                fontWeight:  FontWeight.w300,
                                color: AppColors.textBlack
                              ),
                            if(timeRangeIndex > 0)
                              ElevatedButton.icon(
                                label: Text(''),
                                onPressed: (){
                                  
                                },
                                icon: Icon(Icons.close),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.textBlack,
                                  fixedSize: Size(15.h, 15.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ), 
                              ),
                            SizedBox(width: 10.h),
                            Expanded(
                              child: appointmentDate.text.isNotEmpty
                                  ? CustomTextField2(
                                      title: '09:00am',
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: appointmentDate,
                                      readOnly: true,
                                      onTap: () async {
                                        TimeOfDay? pickedTime = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (context, child) => Theme(
                                              data: ThemeData.dark().copyWith(
                                                colorScheme: const ColorScheme.light(
                                                onPrimary: AppColors.white, // selected text color
                                                onSurface: AppColors.black, // default text color
                                                primary: AppColors.darkGreen, // circle color
                                                ),
                                                dialogBackgroundColor: AppColors.white,
                                                textButtonTheme: TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    textStyle: const TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 12,
                                                      fontFamily: 'Quicksand'
                                                    ),
                                                  ),
                                                ),
                                                
                                              ),
                                              child: child!,
                                            ),
                                        );

                                        if (pickedDate != null) {
                                          appointmentDate.text = pickedTime.toString();//.split(" ")[0];;
                                        }
                                        setState(() {});
                                      },
                                      suffixIcon: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10.h),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: AppColors.grey,
                                              size: 28.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                : CustomTextField(
                                hintText: '09:00am',
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: appointmentDate,
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder: (context, child) => Theme(
                                        data: ThemeData.dark().copyWith(
                                          colorScheme: const ColorScheme.light(
                                          onPrimary: AppColors.white, // selected text color
                                          onSurface: AppColors.black, // default text color
                                          primary: AppColors.darkGreen, // circle color
                                          ),
                                          dialogBackgroundColor: AppColors.white,
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              textStyle: const TextStyle(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                fontFamily: 'Quicksand'
                                              ),
                                            ),
                                          ),
                                          
                                        ),
                                        child: child!,
                                      ),
                                  );

                                  if (pickedDate != null) {
                                    appointmentDate.text = pickedTime.toString();//.split(" ")[0];;
                                  }
                                  setState(() {});
                                },
                                suffixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.h),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.textBlack,
                                        size: 28.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10.h),
                            Expanded(
                              child: appointmentDate.text.isNotEmpty
                                  ? CustomTextField2(
                                      title: '09:00am',
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      controller: appointmentDate,
                                      readOnly: true,
                                      onTap: () async {
                                        TimeOfDay? pickedTime = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (context, child) => Theme(
                                              data: ThemeData.dark().copyWith(
                                                colorScheme: const ColorScheme.light(
                                                onPrimary: AppColors.white, // selected text color
                                                onSurface: AppColors.black, // default text color
                                                primary: AppColors.darkGreen, // circle color
                                                ),
                                                dialogBackgroundColor: AppColors.white,
                                                textButtonTheme: TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    textStyle: const TextStyle(
                                                      color: AppColors.black,
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 12,
                                                      fontFamily: 'Quicksand'
                                                    ),
                                                  ),
                                                ),
                                                
                                              ),
                                              child: child!,
                                            ),
                                        );

                                        if (pickedDate != null) {
                                          appointmentDate.text = pickedTime.toString();//.split(" ")[0];;
                                        }
                                        setState(() {});
                                      },
                                      suffixIcon: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10.h),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: AppColors.grey,
                                              size: 28.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                : CustomTextField(
                                hintText: '09:00am',
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: appointmentDate,
                                readOnly: true,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder: (context, child) => Theme(
                                        data: ThemeData.dark().copyWith(
                                          colorScheme: const ColorScheme.light(
                                          onPrimary: AppColors.white, // selected text color
                                          onSurface: AppColors.black, // default text color
                                          primary: AppColors.darkGreen, // circle color
                                          ),
                                          dialogBackgroundColor: AppColors.white,
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              textStyle: const TextStyle(
                                                color: AppColors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                fontFamily: 'Quicksand'
                                              ),
                                            ),
                                          ),
                                          
                                        ),
                                        child: child!,
                                      ),
                                  );

                                  if (pickedDate != null) {
                                    appointmentDate.text = pickedTime.toString();//.split(" ")[0];;
                                  }
                                  setState(() {});
                                },
                                suffixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.h),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.textBlack,
                                        size: 28.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10.h),
                            if(timeRangeIndex == 0)
                              ElevatedButton.icon(
                                label: Text(''),
                                onPressed: (){
                                  
                                },
                                icon: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.textBlack,
                                  fixedSize: Size(15.h, 15.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ), 
                              ),
                            if(timeRangeIndex > 0)
                              Expanded(child: Text('')),
                            SizedBox(width: 10.h),
                          ],
                        );
                      }
                    ),
                   ],
                 );
              }
            ),
            SizedBox(height: 20.h),
            buttonWithBorder(
                'Save',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                textColor: AppColors.white,
                fontWeight: FontWeight.w300,
                busy: appointmentService.isLoading,
                onTap: () {
                },
            ),
          ],
        ),
      );
    });
  }
}