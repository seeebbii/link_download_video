import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:link_download_video/FacebookData.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class facebookDownloader extends StatefulWidget {
  @override
  _facebookDownloaderState createState() => _facebookDownloaderState();
}

class _facebookDownloaderState extends State<facebookDownloader> {
  final Dio dio = Dio();
  final fieldController = TextEditingController();
  String finalLink;
  FacebookProfile _fbProfile;

  void getResponse() async {
    if (fieldController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Cannot Be Empty'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var url = fieldController.text.toString();

      if (url.startsWith("https://www.facebook.com/") ||
          url.startsWith("https://fb.watch/")) {
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
        _fbProfile = await FacebookData.postFromUrl('${url}');
        finalLink = _fbProfile.postData.videoHdUrl;
        if (finalLink == null) {
          final snackBar = SnackBar(content: Text('Invalid Link'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          downloadFile("$finalLink");
        }
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
          directory = Directory(
              "/data/user/0/com.codeminers.link_download_video/app_flutter/facebook/");
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
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
        title: Text("Facebook Downloader"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: fieldController,
                  decoration: InputDecoration(
                    labelText: "Enter Link for Facebook",
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
                ElevatedButton(
                  child: Text("Download"),
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
                  onPressed: getResponse,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
