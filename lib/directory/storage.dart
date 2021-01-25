import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class StorageModel{

  Future<String> get tiktokPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/tiktok/";
    return newPath;
  }

  Future<String> get likeePath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/likee/";
    return newPath;
  }

  Future<String> get shareChatPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/shareChat/";
    return newPath;
  }

  Future<String> get chingariPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/chingari/";
    return newPath;
  }

  Future<String> get funimatePath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/funimate/";
    return newPath;
  }

  Future<String> get joshPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/josh/";
    return newPath;
  }
  Future<String> get mojPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/moj/";
    return newPath;
  }
  Future<String> get pinterestPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/pinterest/";
    return newPath;
  }
  Future<String> get rizzlePath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/rizzle/";
    return newPath;
  }
  Future<String> get instaPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/instagram/";
    return newPath;
  }
  Future<String> get facebookPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/facebook/";
    return newPath;
  }
  Future<String> get whatsappPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/whatsapp/";
    return newPath;
  }
  Future<String> get twitterPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/twitter/";
    return newPath;
  }
  Future<String> get roposoPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/roposo/";
    return newPath;
  }
  Future<String> get snackPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/snackVideo/";
    return newPath;
  }
  Future<String> get takatakPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/takatak/";
    return newPath;
  }
  Future<String> get trillerPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/triller/";
    return newPath;
  }
  Future<String> get vimeoPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/vimeo/";
    return newPath;
  }
  Future<String> get trellPath async{
    Directory directory = await getApplicationDocumentsDirectory();
    String newPath = directory.path+"/trell/";
    return newPath;
  }


  Future<List<FileSystemEntity>> getTikTokList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await tiktokPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
         print(file.path);
         files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getLikeeList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await likeePath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getShareChatList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await shareChatPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getChingariList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await chingariPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getFunimateList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await funimatePath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getJoshList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await joshPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getMojList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await mojPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getPinterestList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await pinterestPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getRizzleList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await rizzlePath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getInstaList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await instaPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getFacebookList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await facebookPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getWhatsappList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await whatsappPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getTwitterList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await twitterPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getRoposoList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await roposoPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getSnackVideoList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await snackPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getTakatakList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await takatakPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getTrillerList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await trillerPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getVimeoList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await vimeoPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
        }
      }
    }
    return files;
  }
  Future<List<FileSystemEntity>> getTrellList() async{
    List<FileSystemEntity> files = List<FileSystemEntity>();
    var path = await trellPath;
    Directory d = Directory(path);
    List<FileSystemEntity> l = d.listSync();
    for (FileSystemEntity file in l) {
      if (FileSystemEntity.isFileSync(file.path)) {
        files.add(file);
      } else {
        if (!file.path.contains("/storage/emulated/0/Android")) {
          print(file.path);
          files.addAll(await getTikTokList());
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