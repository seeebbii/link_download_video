import 'dart:io';

import 'package:flutter/material.dart';
import 'package:link_download_video/screens/video_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:video_player/video_player.dart';

final Directory _videoDir =  new Directory('/storage/emulated/0/WhatsApp Business/Media/.Statuses');

class WhatsappBusinessDownloader extends StatefulWidget {
  @override
  _WhatsappBusinessDownloaderState createState() => _WhatsappBusinessDownloaderState();
}

class _WhatsappBusinessDownloaderState extends State<WhatsappBusinessDownloader> {
  @override
  Widget build(BuildContext context) {
    if (!Directory("${_videoDir.path}").existsSync()) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("Whatsapp Business"),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Center(
            child: Text(
              "Install WhatsApp Business\nYour Friend's Status will be available here.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
          title: Text("Whatsapp Business"),
        ),
        body: VideoGrid(directory: _videoDir),
      );
    }
  }
}

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
        imageType: ThumbFormat.PNG, //this image will store in created folderpath
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

    if (videoList != null) {
      if (videoList.length > 0) {
        return GridView.builder(
          itemCount: videoList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 8.0 / 8.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => PlayVideo(
                      video: videoList[index],
                    )),
              ),
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

class PlayVideo extends StatefulWidget {
  final String video;
  PlayVideo({this.video});

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  void initState() {
    super.initState();
    print("here is what you looking for:" + widget.video);
  }

  void dispose() {
    super.dispose();
  }

  void _onLoading(bool t, String str) {
    if (t) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator()),
                ),
              ],
            );
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleDialog(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Great, Saved in App Gallery",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            Text(str,
                                style: TextStyle(
                                  fontSize: 16.0,
                                )),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            Text("App > Gallery > Whatsapp Business",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.teal)),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            MaterialButton(
                              child: Text("Close"),
                              color: Colors.teal,
                              textColor: Colors.white,
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
        leading: IconButton(
          color: Colors.indigo,
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          child: FlatButton.icon(
            color: Colors.indigo,
            textColor: Colors.white,
            icon: Icon(Icons.file_download),
            padding: EdgeInsets.all(10.0),
            label: Text(
              'Download Status',
              style: TextStyle(fontSize: 16.0),
            ), //`Text` to display
            onPressed: () async {
              _onLoading(true, "");

              File originalVideoFile = File(widget.video);
              Directory directory = await getApplicationDocumentsDirectory();
              if (!Directory("${directory.path}/whatsappBusiness").existsSync()) {
                Directory("${directory.path}/whatsappBusiness")
                    .createSync(recursive: true);
              }
              String path = directory.path;
              String curDate = DateTime.now().toString();
              String newFileName = "$path/whatsappBusiness/VIDEO-$curDate.mp4";
              print(newFileName);
              await originalVideoFile.copy(newFileName);

              _onLoading(false,
                  "If Video not available in gallary\n\nYou can find all videos at");
            },
          ),
        ),
      ),
      body: Container(
        child: VideoController(
          videoPlayerController: VideoPlayerController.file(File(widget.video)),
          looping: false,
          videoSrc: widget.video,
        ),
      ),
    );
  }
}

