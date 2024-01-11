import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicon/services/auth_services/auth_provider.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/pages/auth/login.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/croper.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/ui/utils/utils.dart';
import 'package:provider/provider.dart';

//import 'signup5_view.dart';

class UploadUserPhotoView extends StatefulWidget {
  
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const UploadUserPhotoView(this.email,
  this.firstName,
  this.lastName,
  this.password,
  this.confirmPassword, 
  {super.key});

  @override
  _UploadUserPhotoViewState createState() => _UploadUserPhotoViewState();
}

class _UploadUserPhotoViewState extends State<UploadUserPhotoView> {
  final TextEditingController _bio = TextEditingController();
  File? _imageFile;
  List<int>? imageBytes;
  String? imageName;
  BuildContext? _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return CustomScaffold(
        title: '',
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            SizedBox(height: 50.h),
            regularText(
              'A picture is worth a\nbillion words',
              fontSize: 37.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            regularText(
              'Do you have one?',
              fontSize: 15.sp,
              textAlign: TextAlign.center,
              height: 1.8,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            SizedBox(height: 54.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: getImageGallery,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.h),
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            height: 100.h,
                            width: 100.h,
                          )
                        : Container(
                            height: 100.h,
                            width: 100.h,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                            ),
                            child: Image.asset(
                              'assets/images/camera.png',
                              width: 36.h,
                              height: 36.h,
                            ),
                          ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'Bio',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _bio,
              maxLines: 5,
            ),
            SizedBox(height: 20.h),
            Consumer<AuthServices>(builder: (ctx, authProvider, child) {
                return buttonWithBorder('Submit',
                    buttonColor: AppColors.darkGreen,
                    fontSize: 15.sp,
                    height: 56.h,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600, 
                    onTap: () {
                      authProvider.UploadFile(
                        context: ctx,
                        imageBytes: imageBytes!,
                        imageName: imageName!,
                      );
                });
            }),
            SizedBox(height: 40.h),
          ],
        ));
  }

  Future getImageGallery() async {
    // * Pick a File
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      // * cast it to bytes
      imageBytes = result.files.single.bytes!.cast();
      // * Get its name, will use it later.
      imageName = result.files.single.name;

      successSnackBar(_context!, "File reading very successful");
    }else{
      errorSnackBar(_context!, "File reading failed, please try again");
    }
}

  Future getImageGallery2() async {
    Utils.offKeyboard();
    print("SEEN 1");
    FilePickerResult? _result = await FilePicker.platform.pickFiles(type: FileType.image);
    
    var fileBytes = _result?.files.first.bytes;
    var fileName = _result?.files.first.name;
    print("fileName ${fileName}");
    print("fileBytes ${fileBytes}");
    

    if (fileBytes != null) {
      print("_result!.files.first.path");
      print("_result?.files.first.path");
      // _imageFile = File(_result!.files.first.path!);
      // setState(() {});
      final croppedFile =
          await cropImage(context, file: File(_result!.files.first.path!), color: AppColors.darkGreen);
      if ((croppedFile?.path ?? "").isNotEmpty) {
        print("croppedFile?.path");
        print(croppedFile?.path);
        _imageFile = File(croppedFile!.path);
        print("_imageFile");
        print(_imageFile);
        setState(() {});
      }
    } else {
      return;
    }
  }
}
