import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUsercase {
  static Future<File> getUserFolder(String fileName) async {
    var docFolder = await getApplicationDocumentsDirectory();
    var userFolder = Directory("${docFolder.path}/.flutter_geo_alarm");


    if(userFolder.existsSync() ){
        userFolder.create();
    }
    var file = File("${userFolder.absolute}/$fileName");
    if(file.existsSync()){
      file.create();
    }
    return file;
  }
}