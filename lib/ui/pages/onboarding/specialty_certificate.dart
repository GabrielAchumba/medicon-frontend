import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicon/models/external_file.dart';
import 'package:medicon/services/common/file_storage_service.dart';
import 'package:medicon/ui/components/buttons.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/custom_textfield.dart';
import 'package:medicon/ui/components/custom_textfield2.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/components/upload_file.dart';
import 'package:medicon/ui/pages/onboarding/search_specialty.dart';
import 'package:medicon/ui/utils/colors.dart';
import 'package:medicon/ui/utils/specialties.dart';
import 'package:provider/provider.dart';


class SpecialtyCertificateScreen extends StatefulWidget {

  final String groupName;

  const SpecialtyCertificateScreen(this.groupName,
  {super.key});
  @override
  _SpecialtyCertificateScreenState createState() => _SpecialtyCertificateScreenState();
}

class _SpecialtyCertificateScreenState extends State<SpecialtyCertificateScreen> {

  bool removeImage = true;
  bool removeBack = true;
  BuildContext? _context;
  GrouppedExternalFiles grouppedExternalFiles = GrouppedExternalFiles();
  TextEditingController specialty = TextEditingController();

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
          specialty.text.isNotEmpty
              ? CustomTextField2(
                  title: 'Specialty',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: specialty,
                  readOnly: true,
                  onTap: () async {
                    Specialty? res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchSpecialty(),
                      ),
                    );
                    if (res != null) {
                      specialty.text = res.specialty;
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
            hintText: 'Select Specialty',
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: specialty,
            readOnly: true,
            onTap: () async {
              Specialty? res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchSpecialty(),
                ),
              );
              if (res != null) {
                specialty.text = res.specialty;
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
          SizedBox(height: 50.h),
          regularText(
            'Upload Certificate of Specialty Registration',
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
               FilePayload filePayload = await fileStorageProvider.UploadFileOneByOneToGCP(
                    context: ctx,
                    grouppedExternalFiles: grouppedExternalFiles,
                    groupName: widget.groupName
                  );
                  filePayload.others = specialty.text;
                  Navigator.pop(context, filePayload);
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