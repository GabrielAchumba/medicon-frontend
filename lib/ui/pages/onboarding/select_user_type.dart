import 'package:flutter/material.dart';
import 'package:medicon/services/user_services/user_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/custom_textfield2.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/user_type_card.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/search_country.dart';
import 'package:medicon/ui/pages/onboarding/user_details.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/country_cities.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


class SelectUserScreen extends StatefulWidget {

    final String country;

  const SelectUserScreen(this.country,
  {super.key});
  @override
  _SelectUserScreenState createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  
  TextEditingController country = TextEditingController();
  bool removeImage = true;
  bool removeBack = false;
  String userType = "Is Empty";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      removeBack: removeBack,
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          SizedBox(height: 200.h),
          regularText(
            'Which of these are you?',
            fontSize: 16.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: UserTypeCard(
                  title: "General Practitioner",
                  image: 'profile1.png',
                  textColor: Colors.blueAccent,
                  onTap: () {
                    userType = "General Practitioner";
                  }
                ),
              ),
              Expanded(
                child: UserTypeCard(
                  title: "Specialist",
                  image: 'profile0.png',
                  textColor: Colors.orangeAccent,
                  onTap: () {
                    userType = "Specialist";
                  }
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          buttonWithBorder(
            'Continue',
            buttonColor: AppColors.darkGreen,
            fontSize: 15.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w300,
            onTap: () {
              if (userType == "Is Empty") {
                  errorSnackBar(context, 'Who you are cannot be empty');
              } else {
                nextPage(context, page: UserDetailsScreen(
                  widget.country,
                  userType
                ));
              }
              
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}