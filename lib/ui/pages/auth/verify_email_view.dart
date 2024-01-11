import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_pin_textfield.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/reset_password_screen.dart';
import 'package:medicon/ui/pages/auth/upload_user_photo.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
//import '../../../services/unique/notifications_service.dart';

class VerifyEmailView extends StatefulWidget {

  final String email;


  const VerifyEmailView(this.email,
  {super.key});
  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  TextEditingController code = TextEditingController();

  Timer? countdown;
  int remainingTime = 300;

  @override
  void initState() {
    countdown = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      remainingTime--;
      setState(() {});
      if (remainingTime == 0) {
        countdown?.cancel();
        return;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    countdown?.cancel();
    super.dispose();
  }

  bool removeImage = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServices>(builder: (context, provider, _) {
      return CustomScaffold(
        title: '',
        removeImage: removeImage,
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            SizedBox(height: 50.h),
            regularText(
              'Verify reset code',
              fontSize: 25.sp,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            regularText(
              'Enter code that we have sent to your \n${widget.email}.',
              fontSize: 13.sp,
              textAlign: TextAlign.start,
              height: 1.8,
              //fontWeight: FontWeight.w400,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 61.h),
            CustomPinTextField(
              controller: code,
              maxLength: 6,
              onDone: (a) {
                verifyOtp();
              },
            ),
            SizedBox(height: 20.h),
            buttonWithBorder('Verify',
                buttonColor: AppColors.darkGreen,
                fontSize: 15.sp,
                height: 56.h,
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,
                busy: provider.isLoading, onTap: () {
              provider.verifyEmail(
                  context: context,
                  email: widget.email,
                  otp: code.text,
                );
            }),
            SizedBox(height: 40.h),
          ],
        ),
        bottomSheet: Container(
            color: AppColors.lemon,
            padding: EdgeInsets.all(20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Haven’t received?  ',
                    style: GoogleFonts.rubik(
                      color: AppColors.textBlack,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                        text: remainingTime == 0
                            ? 'Resend'
                            : remainingTime.toString() + (remainingTime < 10 ? ' sec' : ' secs'),
                        style: GoogleFonts.rubik(
                          color: AppColors.darkGreen,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (remainingTime < 1) {
                              /* provider.forgotPassword(
                                context: context,
                                email: widget.email,
                                isResend: true,
                              ); */

                              provider.verifyEmail(
                                context: context,
                                email: widget.email,
                                otp: code.text,
                              );
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }

  bool isLoading = false;

  verifyOtp() async {}

  // verifyNumber() async {
  //   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //   String smsCode = code.text.trim();
  //
  //   PhoneAuthCredential _credential = PhoneAuthProvider.credential(
  //       verificationId: widget.token, smsCode: smsCode);
  //
  //   try {
  //     final UserCredential result =
  //         await _firebaseAuth.signInWithCredential(_credential);
  //
  //     if (result.user != null) {
  //       result.user!.updatePhotoURL(widget.country).then((value) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         addFcm();
  //         pushAndRemoveUntil(context, const MainLayout());
  //       });
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     errorSnackBar(context, e.message!);
  //   } on PlatformException catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     errorSnackBar(context, e.message!);
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     errorSnackBar(context, e.toString());
  //   }
  // }

  // Future<bool> addFcm() async {
  //   const api = 'https://cafiabackend.herokuapp.com/api/user/store';
  //   String? fcmToken = await locator.get<NotificationService>().getFirebaseToken();
  //
  //   String? tokens = await locator.get<FirebaseAuthService>().currentUserRaw?.getIdToken();
  //   http.Response response = await http.post(
  //     Uri.parse(api),
  //     body: {
  //       'fcm': fcmToken,
  //     },
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $tokens',
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     return true;
  //   }
  //
  //   return false;
  // }
}