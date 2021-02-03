import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoGrid extends StatefulWidget {
  final Directory directory;
  InterstitialAd interstitialAd;
  double aspectRatio;


  VideoGrid({Key key, this.directory, this.interstitialAd, this.aspectRatio})
      : super(key: key);

  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {


  InterstitialAd createInterstitialAd(){
    return InterstitialAd(adUnitId: InterstitialAd.testAdUnitId, listener: (MobileAdEvent event){
      print("Interstitial event: $event");
    });
  }


  _getImage(videoPathUrl) async {
    //await Future.delayed(Duration(milliseconds: 500));
    String thumb = await VideoThumbnail.thumbnailFile(
        video: videoPathUrl,
        imageFormat: ImageFormat.PNG,
        //this image will store in created folderpath
        quality: 10);
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    var videoList = widget.directory
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".mp4"))
        .toList(growable: false);

    void deleteFile(String path) async {
      final file = File(path);
      await StorageModel().deleteFile(file).then((value) {
        setState(() {
          videoList = videoList;
        });
      });
    }


    if (videoList != null) {
      if (videoList.length > 0) {
        return GridView.builder(
          itemCount: videoList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 8.0 / 8.0),
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                deleteFile(videoList[index]);
              },
              onTap: () {
                if(widget.interstitialAd != null){
                  widget.interstitialAd?.show();
                }else{print("NULL");}

                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => PlayVideo(
                            video: videoList[index],
                        aspectRatio: widget.aspectRatio,
                          )),
                ).then((value) {
                  widget.interstitialAd = createInterstitialAd()..load();
                });

              },
              child: FutureBuilder(
                  future: _getImage(videoList[index]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Hero(
                          tag: videoList[index],
                          child: Image.file(
                            File(snapshot.data),
                            height: 150.0,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    } else {
                      return Hero(
                        tag: videoList[index],
                        child: Container(
                          height: 280.0,
                          child: Image.asset("assets/images/video_loader.gif"),
                        ),
                      );
                    }
                  }),
            );
          },
        );
      } else {
        return Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text(
              "Sorry, No Videos Found.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
