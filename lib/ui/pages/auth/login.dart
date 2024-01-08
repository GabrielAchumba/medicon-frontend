import 'package:flutter/material.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController country = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String selectedCountry = "";
  bool _passwordVisible = false;
  bool isForgotPasswordVisible = false;
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
            'Welcome back',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'Fill in your details or continue with your social handles',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.grey
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Email',
            controller: email,
            // maxLength: 11,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            obscureText: _passwordVisible,
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
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Remember me',
                style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w800, fontSize: 15),
              ),
              Expanded(
                child: Text(''),
              ),
              Visibility(
                visible: isForgotPasswordVisible == false ? true : false,
                child: GestureDetector(
                  onTap: () {
                    nextPage(context, page: const ForgetPasswordScreen());
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
               
                     child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGreen,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35.h),
          buttonWithBorder(
            'Sign in',
            buttonColor: AppColors.darkGreen,
            fontSize: 15.sp,
            height: 56.h,
            //busy: authProvider.isLoading,
            textColor: AppColors.white,
            fontWeight: FontWeight.w300,
            onTap: () {
              pushReplacement(context, const Placeholder());
            },
          ),
          SizedBox(height: 20.h),
          HorizontalDivider(text: "Or sign in with",),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buttonWithBorder(
                  'Facebook',
                  buttonColor: AppColors.white,
                  fontSize: 15.sp,
                  height: 56.h,
                  borderColor: AppColors.grey,
                  icon: 'logo',
                  //busy: authProvider.isLoading,
                  textColor: AppColors.black,
                  fontWeight: FontWeight.w300,
                  onTap: () {
                    pushReplacement(context, const Placeholder());
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: buttonWithBorder(
                  'Google',
                  buttonColor: AppColors.white,
                  fontSize: 15.sp,
                  height: 56.h,
                  borderColor: AppColors.grey,
                  icon: 'logo',
                  //busy: authProvider.isLoading,
                  textColor: AppColors.black,
                  fontWeight: FontWeight.w300,
                  onTap: () {
                    pushReplacement(context, const Placeholder());
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do not  have an account?',
                style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w800, fontSize: 15),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    nextPage(context, page: const CreateNewAccount());
                  },
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                        color: AppColors.black, fontSize: 15, fontWeight: FontWeight.w800),
                  ))
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}