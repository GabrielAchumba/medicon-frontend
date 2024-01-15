import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/services/common/file_storage_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/horizontal_dividers.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/upload_file.dart';
import 'package:medicon/ui/pages/auth/create_new_account.dart';
import 'package:medicon/ui/pages/auth/forgot_password.dart';
import 'package:medicon/ui/pages/onboarding/select_country.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/router.dart';
import 'package:medicon/utils/router.dart';
import 'package:provider/provider.dart';


class ProofOfMedicalQualificationScreen extends StatefulWidget {

  final String groupName;

  const ProofOfMedicalQualificationScreen(this.groupName,
  {super.key});
  @override
  _ProofOfMedicalQualificationScreenState createState() => _ProofOfMedicalQualificationScreenState();
}

class _ProofOfMedicalQualificationScreenState extends State<ProofOfMedicalQualificationScreen> {

  TextEditingController yearOfMedicalQualification = TextEditingController();
  bool removeImage = true;
  bool removeBack = true;
  BuildContext? _context;
  GrouppedExternalFiles grouppedExternalFiles = GrouppedExternalFiles();

  @override
  Widget build(BuildContext context) {
    _context = context;
    return CustomScaffold(
      title: '',
      removeBack: removeBack,
      removeImage: removeImage,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          regularText(
            'Onboarding',
            fontSize: 25.sp,
            textAlign: TextAlign.start,
            fontWeight:  FontWeight.w600,
            color: AppColors.black
          ),
          SizedBox(height: 10.h),
          regularText(
            'Upload file from your computer',
            fontSize: 13.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w200,
          ),
          SizedBox(height: 50.h),
          regularText(
            'In what year did you qualify to practice medicine?',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Year of Medical Qualification',
            controller: yearOfMedicalQualification,
            // maxLength: 11,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 20.h),
          regularText(
            'Please upload medical qualification\n(Certificate of qualification)',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w400,
          ),
          SizedBox(height: 30.h),
          regularText(
            'Upload in PDF or Doc',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w200,
          ),
          SizedBox(height: 10.h),
          UploadFileCard(
            onTap: getImageGallery
          ),
          SizedBox(height: 20.h),
          Consumer<FileStorageServices>(builder: (ctx, fileStorageProvider, child) {
            return buttonWithBorder(
              'Submit',
              buttonColor: AppColors.darkGreen,
              fontSize: 15.sp,
              height: 56.h,
              busy: fileStorageProvider.isLoading,
              textColor: AppColors.white,
              fontWeight: FontWeight.w300,
              onTap: () async {
                if (yearOfMedicalQualification.text.isEmpty) {
                  errorSnackBar(context, 'Year of medical qualification cannot be empty');
                } else {
                  FilePayload filePayload = await fileStorageProvider.UploadFileOneByOneToGCP(
                    context: ctx,
                    grouppedExternalFiles: grouppedExternalFiles,
                    groupName: widget.groupName
                  );
                  filePayload.others = yearOfMedicalQualification.text;
                  Navigator.pop(context, filePayload);
                }
              },
            ); 
          }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  
  Future getImageGallery() async {
    // * Pick a File
    FilePickerResult? result = 
    await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
      );

    if (result != null) {
      grouppedExternalFiles = GrouppedExternalFiles();
      int i = 0;
      for (var element in result.files) {
        i++;
        List<int> fileBytes = element.bytes!.cast();
        String fileName = element.name;
        var obj = ExternalFile(
          fileBytes, 
          fileName
        );
        grouppedExternalFiles.externalFiles.add(obj);
      }
      successSnackBar(_context!, "File(s) reading very successful");
    }else{
      errorSnackBar(_context!, "File(s) reading failed, please try again");
    }
  }
}