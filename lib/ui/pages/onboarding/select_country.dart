import 'package:flutter/material.dart';
import 'package:medicon/services/user_services/user_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/custom_textfield2.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/search_country.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/country_cities.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


class SelectCountryScreen extends StatefulWidget {


  const SelectCountryScreen({super.key});
  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  
  TextEditingController country = TextEditingController();
  bool removeImage = true;
  bool removeBack = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      removeBack: removeBack,
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'Add History',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 150.h),
          regularText(
            'Which country are you from?',
            fontSize: 16.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack
          ),
          SizedBox(height: 30.h),
          country.text.isNotEmpty
              ? CustomTextField2(
                  title: 'Country',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: country,
                  readOnly: true,
                  onTap: () async {
                    Country? res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchCountry(),
                      ),
                    );
                    if (res != null) {
                      country.text = res.country;
                      //code.text = res.code!;
                      //selectedCountry = res.sId!;
                    }
                    setState(() {});
                  },
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.h),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.grey,
                          size: 28.h,
                        ),
                      ),
                    ],
                  ),
                )
            : CustomTextField(
            hintText: 'Select Country',
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: country,
            readOnly: true,
            onTap: () async {
              Country? res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchCountry(),
                ),
              );
              if (res != null) {
                country.text = res.country;
                //code.text = res.code!;
                //selectedCountry = res.sId!;
              }
              setState(() {});
            },
            suffix: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textBlack,
                    size: 28.h,
                  ),
                ),
              ],
            ),
            ),
          SizedBox(height: 30.h),
          buttonWithBorder(
            'Continue',
            buttonColor: AppColors.darkGreen,
            fontSize: 15.sp,
            height: 56.h,
            //busy: authProvider.isLoading,
            textColor: AppColors.white,
            fontWeight: FontWeight.w300,
            onTap: () {
              nextPage(context, page: const Placeholder());
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}