import 'dart:convert';

import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:medicon/models/external_file.dart';
import 'package:medicon/ui/components/snackbar.dart';
import 'package:medicon/utils/router.dart';
import 'package:medicon/ui/pages/auth/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileStorageServices with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";
  String baseUrl = "http://localhost:8000";
  //String baseUrl = "https://medicon-backend.vercel.app";

  late final Dio _dio;

  FileStorageServices() : _dio = Dio();

  Future<FilePayload> UploadFileOneByOneToGCP({
    BuildContext? context,
    GrouppedExternalFiles? grouppedExternalFiles,
    String? groupName,
  }) async {

    String url = "$baseUrl/gcp/upload";
    isLoading = true;
    notifyListeners();

    print("SEEN 1");
    var externalFiles = grouppedExternalFiles?.externalFiles;
    List<MultipartFile>? files = externalFiles?.map((e) => MultipartFile.fromBytes(
        e.imageBytes,
        filename: e.fileName,
        contentType: MediaType("File", e.fileName.split(".").last),
      )).toList();

      List<FormData> listOfFormData = [];
      for(int i = 0; i < files!.length; i++){
        print("FormData $i: ${files[i]}");
        var formData = FormData.fromMap({
          "file": files[i],
        });
        listOfFormData.add(formData);
      }

    FilePayload filePayload = FilePayload();
    List<FilePayloadBackend> ans = [];
    bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    for(int i = 0; i < files.length; i++){
       print("File $i: ${files[i]}");
      var response = await _dio.post(url, data: listOfFormData[i]);
      print("$i: response");
      print("$i: response.data: ${response.data.toString()}");
      ans.add(FilePayloadBackend(
        response.data["url"],
        response.data["fileName"],
        response.data["originalFileName"],
        groupName!
      ));
      print("SEEN 2 of $i");
      if(response.data["error"] != "No Error"){
         print("$i: ERROR SEEN");
        errorMessage = errorMessage + '${response.data["originalFileName"]}' + '\n';
        checkError = true;
        
      }
    }

    isLoading = false;
    notifyListeners();
    filePayload.errorMessage = "No Error";
    if(checkError == true){
      filePayload.errorMessage = errorMessage;
      //errorSnackBar(context!, errorMessage);
    }

    filePayload.filePayloads = ans;
    print("SEEN 3");
    return filePayload;
  }

   Future<FilePayload> UploadFilesAtOnceToGCP({
    BuildContext? context,
    GrouppedExternalFiles? grouppedExternalFiles,
    String? groupName,
  }) async {

    String url = "$baseUrl/gcp/uploadFiles";
    isLoading = true;
    notifyListeners();

    print("SEEN 1");
    var externalFiles = grouppedExternalFiles?.externalFiles;
    List<MultipartFile>? files = externalFiles?.map((e) => MultipartFile.fromBytes(
        e.imageBytes,
        filename: e.fileName,
        contentType: MediaType("File", e.fileName.split(".").last),
      )).toList();

    print("SEEN 2");
    var formData = FormData.fromMap({
      "files": files,
    });
    var response = await _dio.post(url, data: formData);

    print("response");
    print(response.data.toString());
    print("response.data: ${response.data}");

    List<dynamic> results = response.data;
    FilePayload filePayload = FilePayload();
    List<FilePayloadBackend> ans = [];
    bool checkError = false;
    String errorMessage = "Failed to upload file(s):\n";
    for(int i = 0; i < results.length; i++){
      ans.add(FilePayloadBackend(
        results[i]["url"],
        results[i]["fileName"],
        results[i]["originalFileName"],
        groupName!
      ));
      if(response.data[i]["error"] == "No Error"){
         print("$i: ERROR SEEN");
        errorMessage = errorMessage + '${results[i]["originalFileName"]}' + '\n';
        checkError = true;
        
      }
    }

    isLoading = false;
    notifyListeners();
    if(checkError == true){
      filePayload.errorMessage = errorMessage;
      errorSnackBar(context!, errorMessage);
    }else{
      successSnackBar(context!, "File(s) uploaded successfully");
    }

    filePayload.filePayloads = ans;
    return filePayload;
  }

  //Proof of medical qualification
  Future StoreProofOfMedicalQualification(
    {
    BuildContext? context,
    List<FilePayloadBackend>? files,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
     String? tokens = sf.getString("token");
    String url = "$baseUrl/medicalQualification/store";


    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse(url),
      body: {
        "files": files,
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    print(response.body);
    print("=================================================");
    var dataRes = jsonDecode(response.body);
    print(dataRes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      message = dataRes["message"] == null ? "Something went wrong, please try again" : dataRes["message"];
    }
  }
}