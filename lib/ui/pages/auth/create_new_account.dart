import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/login.dart';
import 'package:medicon/ui/pages/auth/terms_of_service.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({
    super.key,
  });
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool isForgotPasswordVisible = false;
  bool accept = false;
  bool removeImage = true;
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'Create a new account',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'Fund your wallet, pay for services and manage your payments in one place',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.grey
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'First Name',
            controller: firstName,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Last Name',
            controller: lastName,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Email Address',
            controller: email,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            obscureText: !_passwordVisible,
            hintText: 'Password',
            controller: password,
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff9BA59F),
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            // maxLength: 11,
            textInputType: TextInputType.name,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            obscureText: !_confirmPasswordVisible,
            hintText: 'Confirm Password',
            controller: confirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff9BA59F),
              ),
              onPressed: () {
                setState(() {
                  _confirmPasswordVisible = !_confirmPasswordVisible;
                });
              },
            ),
            // maxLength: 11,
            textInputType: TextInputType.name,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              InkWell(
                onTap: () => setState(() => accept = !accept),
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: accept ? AppColors.darkGreen : null,
                    //borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(
                      width: 3.h,
                      color: const Color(0xffD0D5DD),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.h),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'By creating an account, you agree to our?\n',
                    style: GoogleFonts.rubik(
                      color: AppColors.textBlack,
                      fontSize: 13.sp,
                    ),
                    children: [
                      TextSpan(
                          text: ' User Agreement and ',
                          style: GoogleFonts.rubik(
                            color: AppColors.darkGreen,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              push(context, const TermsOfService());
                            }),
                      TextSpan(
                        text: 'Terms ',
                        style: GoogleFonts.rubik(
                          color: AppColors.textBlack,
                          fontSize: 13.sp,
                        ),
                      ),
                      TextSpan(
                          text: ' & Conditions',
                          style: GoogleFonts.rubik(
                            color: AppColors.darkGreen,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              push(context, const TermsOfService());
                            }),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Consumer<AuthServices>(builder: (ctx, authProvider, child) {
            return buttonWithBorder(
              'Create new account',
              buttonColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              //busy: authProvider.isLoading,
              textColor: AppColors.white,
              fontWeight: FontWeight.w300,
              onTap: () {
                if (firstName.text.isEmpty ||
                    lastName.text.isEmpty ||
                    email.text.isEmpty ||
                    password.text.isEmpty ||
                    confirmPassword.text.isEmpty) {
                  errorSnackBar(context, 'All fields cannot be empty');
                } else if (accept == false) {
                  errorSnackBar(context, 'Agree to the terms and conditions');
                } else {
                  authProvider.sendOTPToEmail(
                    context: ctx,
                    firstName: firstName.text,
                    lastName: lastName.text,
                    email: email.text,
                    password: password.text,
                    confirmPassword: confirmPassword.text,
                    isResend: false,
                  );
                }
              },
            ); 
          }),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.textBlack, 
                  //fontWeight: FontWeight.w800, 
                  fontSize: 15
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    nextPage(context, page: const LoginScreen());
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        color: AppColors.black, 
                        fontSize: 15, 
                        //fontWeight: FontWeight.w800
                      ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}