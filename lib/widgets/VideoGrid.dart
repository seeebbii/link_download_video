import 'dart:io';

import 'package:flutter/material.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:thumbnails/thumbnails.dart';
class VideoGrid extends StatefulWidget {
  final Directory directory;

  const VideoGrid({Key key, this.directory}) : super(key: key);

  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {

  _getImage(videoPathUrl) async {
    //await Future.delayed(Duration(milliseconds: 500));
    String thumb = await Thumbnails.getThumbnail(
        videoFile: videoPathUrl,
        imageType: ThumbFormat.PNG,//this image will store in created folderpath
        quality: 10);
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    var videoList = widget.directory.listSync().map((item) => item.path).where((item) => item.endsWith(".mp4")).toList(growable: false);

    if(videoList!=null){
      if(videoList.length>0){
        return GridView.builder(
          itemCount: videoList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, childAspectRatio: 8.0/8.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: ()=> Navigator.push(context, new MaterialPageRoute(
                  builder: (context)=>  PlayVideo(video: videoList[index],)
              ),),
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
                      }
                      else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }else{
                      return Hero(
                        tag: videoList[index],
                        child: Container(
                          height: 280.0,
                          child: Image.asset("assets/images/video_loader.gif"),
                        ),
                      );
                    }
                  }
              ),
            );
          },
        );
      }else{
        return Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 60.0),
            child: Text("Sorry, No Videos Found.", style: TextStyle(
                fontSize: 18.0
            ),),
          ),
        );
      }
    }else{
      return Center(child: CircularProgressIndicator(),);
    }
  }
}
