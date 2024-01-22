/* import 'package:cafia/ui/pages/accounts/search_cities.dart';
import 'package:cafia/ui/pages/auth/policy.dart';
import 'package:cafia/ui/pages/auth/terms_and_conditions.dart';
import 'package:cafia/ui/pages/auth/verify_view.dart';
import 'package:cafia/ui/pages/home/dashboard_view.dart';
import 'package:cafia/ui/pages/home/main_layout.dart'; */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../utils/router.dart';

class DasboardScreen extends StatefulWidget {

  final String fullName;

  const DasboardScreen(this.fullName,
  {super.key});
  @override
  _DasboardScreenState createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {


  bool isLoading = false;

  bool accept = false;
  bool removeImage = true;
  bool removeBack = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      removeImage: removeImage,
      removeBack: removeBack,
      title: '',
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(
              children: [
                InkWell(
                  onTap: () => setState(() => accept = !accept),
                  child: Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      color: accept ? AppColors.darkGreen : null,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(
                        width: 3.h,
                        color: const Color(0xffD0D5DD),
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.textBlack,
                      size: 30.h,
                    ),
                  ),
                ),
                SizedBox(width: 8.h),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Good Morning\n',
                      style: GoogleFonts.rubik(
                        color: AppColors.textBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                            text: ' ${widget.fullName} ',
                            style: GoogleFonts.rubik(
                              color: AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

}