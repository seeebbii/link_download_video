import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:link_download_video/InstaData.dart';
import 'package:link_download_video/galleryScreens/Instagram.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class instagramDownloader extends StatefulWidget {
  @override
  _instagramDownloaderState createState() => _instagramDownloaderState();
}

class _instagramDownloaderState extends State<instagramDownloader> {
  final Dio dio = Dio();
  final fieldController = TextEditingController();
  String finalLink;
  InstaProfile _instaProfile;
  InstaPost _instaPost = InstaPost();

  void getResponse() async {
    if (fieldController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text('Cannot Be Empty'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var url = fieldController.text.toString();

      if (url.startsWith("https://www.instagram.com/p/") ||
          url.startsWith("https://www.instagram.com/tv/") ||
          url.startsWith("https://www.instagram.com/reel/")) {
        // SHOW DOWNLOAD PROGRESS
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () async => false, child: downloading);
          },
        );

        _instaProfile = await InstaData.postFromUrl('$url');

        if (_instaProfile == null) {
          // Profile Null
          Navigator.of(context).pop();
          final snackBar = SnackBar(content: Text('Invalid Link'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          // Profile not null

          if (_instaProfile.isPrivate) {
            // ALERT FOR PRIVATE PROFILE
            Navigator.of(context).pop();
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return privateProfile;
              },
            );
          }
          // PROFILE NOT PRIVATE
          _instaPost = _instaProfile.postData;
          if (_instaPost.childPostsCount > 1) {
            Navigator.of(context).pop();

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WillPopScope(
                    onWillPop: () async => false, child: downloadingMultiple);
              },
            );

            _instaPost.childposts.forEach((element) {
              downloadMultipleFiles(
                  element.videoUrl, _instaPost.childPostsCount);
            });
          } else {
            print(_instaPost.videoUrl);
            downloadFile(_instaPost.videoUrl);
          }
        }
      } else if (url.startsWith("https://www.instagram.com/stories/")) {
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
              "/data/user/0/com.codeminers.link_download_video/app_flutter/instagram/");
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

  static int filesDownloaded = 0;
  downloadMultipleFiles(String url, int totalVideos) async {
    print("Total Videos $totalVideos");
    bool downloaded =
        await saveVideo(url, "${DateTime.now()}.mp4").then((value) {
      if (value) {
        filesDownloaded++;
      }
    });

    if (filesDownloaded == totalVideos) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Number of videos downloaded: $filesDownloaded"),
              content: Text("Press anywhere to continue"));
        },
      );
    }

    // if (downloaded) {
    //   setState(() {
    //     ++filesDownloaded ;
    //   });
    //   print("File downloaded");
    //   downloaded = null;
    // } else {
    //   print("Failed to download");
    //   downloaded = null;
    //
    // }
    // if(filesDownloaded == totalVideos){
    //   Navigator.of(context).pop();
    //   showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //           title: Text("Number of videos downloaded: $filesDownloaded"),
    //           content: Text("Press anywhere to continue"));
    //     },
    //   );
    // }else if (filesDownloaded < totalVideos){
    //   Navigator.of(context).pop();
    //   showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //           title: Text("Some videos failed to download, Total downloaded: $filesDownloaded / $totalVideos"),
    //           content: Text("Press anywhere to continue"));
    //     },
    //   );
    // }
  }

  downloadFile(String url) async {
    bool downloaded = await saveVideo(url, "${DateTime.now()}.mp4");
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

  AlertDialog downloadingMultiple = AlertDialog(
    title: Text("Downloading Multiple Videos, Please Wait."),
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
  AlertDialog privateProfile = AlertDialog(
      title: Text("ERROR !"),
      content: Text(
          "You cannot download video from a private account!\nPress anywhere to continue"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Downloader"),
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: fieldController,
                decoration: InputDecoration(
                  labelText: "Enter Link for Instagram",
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
    );
  }
}
