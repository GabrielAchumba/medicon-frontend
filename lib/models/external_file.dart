class GrouppedExternalFiles {
  late List<ExternalFile> externalFiles;
  late String groupName;
  late String groupId;
}

class ExternalFile {
  late List<int> imageBytes;
  late String fileName;


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