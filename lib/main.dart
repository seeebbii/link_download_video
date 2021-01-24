import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:link_download_video/screens/SplashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MaterialApp(
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
  final url = "https://r2---sn-2uja-3ipe7.googlevideo.com/videoplayback?expire=1611539749&ei=xdANYMyNGLeCxN8Pz_Wy8AE&ip=72.255.58.113&id=o-ALCUr235Dn-XgUvya41cysvOoJmPHkUFuZzDivit1IPo&itag=133&aitags=133%2C160%2C242%2C278&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&ns=uRYXn1-6QHLDeCyr_wPM6LAF&gir=yes&clen=380444&otfp=1&dur=12.212&lmt=1484057088474835&fvip=2&keepalive=yes&c=WEB&n=cxTV26qG5w1LOg&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cotfp%2Cdur%2Clmt&sig=AOq0QJ8wRQIgV5fCbjAzPNutqR6dA4tvUo-yjMXhBZWk3oB_JRbfsnICIQDnBZoA8numnDX7ABnSaWaZC-hgqlh1ep9WGDy9JIb1kw%3D%3D&alr=yes&cpn=ttUMERmgcQjzxmhm&cver=2.20210120.08.00&redirect_counter=1&cm2rm=sn-jtcxg-aixz7l&cms_redirect=yes&ipbypass=yes&mh=yp&mm=29&mn=sn-2uja-3ipe7&ms=rdu&mt=1611517963&mv=m&mvi=2&pcm2cms=yes&pl=24&lsparams=ipbypass,mh,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AG3C_xAwRQIgfkP2Zf8nsbMT9b1e0Lf8daEpqVHwB9U83rJy_uvGyTgCIQCZwggATt6ScLAKdO0IpdL9WgiAe8GkQg_BXjCG4_weUA%3D%3D&rn=25";
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
          String newPath = directory.path+"/tiktok/";
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
    bool downloaded = await saveVideo(
        url,
        "${DateTime.now()}.mp4");
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