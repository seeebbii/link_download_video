import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class StorageModel{

  Future<String> get localPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/tiktok/";
    return newPath;
  }


  Future<List<FileSystemEntity>> getList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await localPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
         print(file.path);
         files.addAll(await getList());
        }
      }
    }
    return files;
  }


  Future deleteFile(File file) async{
    try{
      await file.delete();
    }catch(e){
      print(e);
    }
  }

}