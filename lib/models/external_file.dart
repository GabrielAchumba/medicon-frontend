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

  ExternalFile(List<int> imageBytes, String fileName){
    this.imageBytes = imageBytes;
    this.fileName = fileName;
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

class FilePayloadBackend {

  late String url;
  late String fileName;
  late String originalFileName;
  late String groupName;

  FilePayloadBackend(String url, 
  String fileName, 
  String originalFileName,
  String groupName){
    this.url = url;
    this.fileName = fileName;
    this.originalFileName = originalFileName;
    this.groupName = groupName;
  }
}