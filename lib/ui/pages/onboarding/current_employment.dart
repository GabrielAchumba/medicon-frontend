import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/services/common/file_storage_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/upload_file.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:provider/provider.dart';


class CurrentEmploymentScreen extends StatefulWidget {

  final String groupName;

  const CurrentEmploymentScreen(this.groupName,
  {super.key});
  @override
  _CurrentEmploymentScreenState createState() => _CurrentEmploymentScreenState();
}

class _CurrentEmploymentScreenState extends State<CurrentEmploymentScreen> {

  TextEditingController dateStarted = TextEditingController();
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
            'Current Employment (date started)',
            fontSize: 14.sp,
            textAlign: TextAlign.start,
            color: AppColors.textBlack,
            fontWeight:  FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            hintText: 'Date of employment',
            controller: dateStarted,
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
           onTap: (){

            },
            onPressed:getImageGallery,
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
                if (dateStarted.text.isEmpty) {
                  errorSnackBar(context, 'Current Employement (date started) cannot be empty ');
                } else {
                  FilePayload filePayload = await fileStorageProvider.UploadFileOneByOneToGCP(
                    context: ctx,
                    grouppedExternalFiles: grouppedExternalFiles,
                    groupName: widget.groupName
                  );
                  filePayload.others = dateStarted.text;
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

    try {
      FilePickerResult? result = 
      await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
        //withData: true
        );

      if (result != null) {
        grouppedExternalFiles = GrouppedExternalFiles();
        for (var element in result.files) {
          List<int> fileBytes = [1, 2, 3];
          String fileName = element.name;
          String filePath = element.path!;
          var obj = ExternalFile(
            fileBytes, 
            fileName,
            filePath
          );
          print(filePath);
          grouppedExternalFiles.externalFiles.add(obj);
        }
        successSnackBar(_context!, "File(s) reading very successful");
      }else{
        errorSnackBar(_context!, "File(s) reading failed, please try again");
      }
    } on Exception catch (exception) {
      print("Error 1 occured");
      print(exception);
    } catch (error) {
      print("Error 2 occured");
      print(error);
    }
  }
}