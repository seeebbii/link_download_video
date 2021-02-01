import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
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
import 'package:link_download_video/screens/SplashScreen.dart';
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
