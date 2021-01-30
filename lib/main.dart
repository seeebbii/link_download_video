import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:link_download_video/downloadingScreens/facebookDownloader.dart';
import 'package:link_download_video/downloadingScreens/funimateDownloader.dart';
import 'package:link_download_video/downloadingScreens/instagramDownloader.dart';
import 'package:link_download_video/downloadingScreens/joshDownloader.dart';
import 'package:link_download_video/downloadingScreens/mojDownloader.dart';
import 'package:link_download_video/downloadingScreens/pinterestDownloader.dart';
import 'package:link_download_video/downloadingScreens/rizzleDownloader.dart';
import 'package:link_download_video/downloadingScreens/roposoDownloader.dart';
import 'package:link_download_video/downloadingScreens/sharechatDownloader.dart';
import 'package:link_download_video/downloadingScreens/snackvideoDownloader.dart';
import 'package:link_download_video/downloadingScreens/takatakDownloader.dart';
import 'package:link_download_video/downloadingScreens/trellDownloader.dart';
import 'package:link_download_video/downloadingScreens/trillerDownloader.dart';
import 'package:link_download_video/downloadingScreens/twitterDownloader.dart';
import 'package:link_download_video/downloadingScreens/vimeoDownloader.dart';
import 'package:link_download_video/downloadingScreens/whatsappDownloader.dart';
import 'package:link_download_video/galleryScreens/aboutus.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:link_download_video/screens/SplashScreen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'downloadingScreens/chingariDownloader.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        accentColor: Color.fromRGBO(255, 119, 129, 1.0),
        accentColorBrightness: Brightness.light,
      ),
      routes: {
        "/chingariDownload": (context) => chingariDownloader(),
        "/facebookDownload": (context) => facebookDownloader(),
        "/funimateDownload": (context) => funimateDownloader(),
        "/instagramDownload": (context) => instagramDownloader(),
        "/joshDownload": (context) => joshDownloader(),
        "/mojDownload": (context) => mojDownloader(),
        "/pinterestDownload": (context) => pinterestDownloader(),
        "/rizzleDownload": (context) => rizzleDownloader(),
        "/roposoDownload": (context) => roposoDownloader(),
        "/sharechatDownload": (context) => sharechatDownloader(),
        "/snackvideoDownload": (context) => snackvideoDownloader(),
        "/takatakDownload": (context) => takatakDownloader(),
        "/trellDownload": (context) => trellDownloader(),
        "/trillerDownload": (context) => trillerDownloader(),
        "/twitterDownload": (context) => twitterDownloader(),
        "/vimeoDownload": (context) => vimeoDownloader(),
        "/whatsappDownload": (context) => whatsappDownloader(),
        "/aboutus": (context) => aboutus(),
      },
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final url =
      "https://appvideopromo.000webhostapp.com/user_videos/RZ7DisPcBW.mp4";
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
          String newPath = directory.path + "/tiktok/";
          directory = Directory(newPath);
          // print(directory);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
            print("$progress: Total: $value2");
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(url, "${DateTime.now()}.mp4");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: progress,
                ),
              )
            : FlatButton.icon(
                icon: Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                ),
                color: Colors.blue,
                onPressed: downloadFile,
                padding: const EdgeInsets.all(10),
                label: Text(
                  "Download Video",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
      ),
    );
  }
}
