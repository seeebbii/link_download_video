import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:link_download_video/model/parseLink.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:link_download_video/screens/SplashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class TikTokDownloader extends StatefulWidget {
  @override
  _TikTokDownloaderState createState() => _TikTokDownloaderState();
}

class _TikTokDownloaderState extends State<TikTokDownloader> {
  final Dio dio = Dio();
  final fieldController = TextEditingController();
  String finalLink;

  void getResponse() async {
    if (fieldController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Cannot Be Empty'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var url = fieldController.text.toString();
      if (url.startsWith("https://www.tiktok.com/") ||
          url.startsWith("https://vm.tiktok.com/")) {
        // SHOW DOWNLOAD PROGRESS
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () async => false, child: downloading);
          },
        );
        // Await the http get response, then decode the json-formatted response.
        var response = await http.get(
            "https://appvideopromo.000webhostapp.com/exemple.php?url=" + url);
        ParseLink object = ParseLink(json.decode(response.body));
        finalLink = object.downloadUrl;
        print(finalLink);
        downloadFile("$finalLink");
      } else {
        // INVALID LINK
        final snackBar = SnackBar(content: Text('Invalid Link'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  static var progress;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = Directory("/data/user/0/com.codeminers.link_download_video/app_flutter/tiktok/");
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
            int total = 10;
            progress = value1.bitLength.toDouble();
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

  bool downloaded;

  downloadFile(String url) async {
    downloaded = await saveVideo(url, "${DateTime.now()}.mp4");
    if (downloaded) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return success;
        },
      );
      print("File downloaded");
    } else {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return failed;
        },
      );
      print("Failed to download");
    }
  }

  AlertDialog downloading = AlertDialog(
    title: Text("Download In Progress"),
    content: Container(
        height: 150, child: Center(child: CircularProgressIndicator())),
  );
  AlertDialog success = AlertDialog(
      title: Text("Download Successful"),
      content: Text("Press anywhere to continue"));
  AlertDialog failed = AlertDialog(
    title: Text("Download Failed"),
    content: Text("Press anywhere to continue"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TikTok Downloader"),
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for TikTok",
                labelStyle: TextStyle(
                  color: Color.fromRGBO(171, 63, 65, 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(171, 63, 65, 1.0),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(171, 63, 65, 1.0),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Color.fromRGBO(171, 63, 65, 1.0);
                    return Color.fromRGBO(
                        255, 119, 129, 1.0); // Use the component's default.
                  },
                ),
              ),
              child: Text(
                "Download",
              ),
              onPressed: getResponse,
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Text(
                    "Follow the Steps below to Download Video From TikTok!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Step 1: Open TikTok and Press the Share button of the video you wish to Download.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Step 2: Select the Copy URL Option from the Video Menu and Paste it Over here.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Step 3: Then Click the Download button and wait until you see the Download Complete Box.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldController.dispose();
    super.dispose();
  }
}
