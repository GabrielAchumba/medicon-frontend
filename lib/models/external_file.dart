import 'dart:convert';
import 'package:medicon/models/file_payload_backend.dart';

class GrouppedExternalFiles {
  late List<ExternalFile> externalFiles;
  late String groupName;
  late String groupId;

  GrouppedExternalFiles(){
    externalFiles = [];
  }
}

class ExternalFile {
  late List<int> imageBytes;
  late String fileName;
  late String filePath;

  ExternalFile(List<int> imageBytes, String fileName, 
  String filePath){
    this.imageBytes = imageBytes;
    this.fileName = fileName;
    this.filePath = filePath;
  }
  ExternalFile.fromJson(dynamic json) {
    imageBytes = json['imageBytes'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_bytes'] = imageBytes;
    data['file_name'] = fileName;
    return data;
  }
}

class FilePayload {
  late List<FilePayloadBackend> filePayloads;
  late String? errorMessage;
  late dynamic others;

  FilePayload(){
    this.filePayloads = [];
  }
}