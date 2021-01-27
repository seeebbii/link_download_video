import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TikTok extends StatefulWidget {
  @override
  _TikTokState createState() => _TikTokState();
}

class _TikTokState extends State<TikTok> {
  List<FileSystemEntity> files;
  List<Uint8List> fileThumbnail;

  Future<List<FileSystemEntity>> getVids() async {
    await StorageModel().getTikTokList().then((value) async {
      if (value != null) {
        setState(() {
          files = value;
        });
      } else {
        print("No Value");
      }
    });
    return files;
  }



  void deleteFile(String path) async {
    final file = File(path);
    await StorageModel().deleteFile(file).then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getThumbNails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tik Tok"),
      ),
      body: FutureBuilder(
        future: getVids(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FileSystemEntity>> vids) {
          if (vids.data != null) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:  2),
              padding: const EdgeInsets.all(15),
              itemCount: vids.hasData ? vids.data.length : 0,
              itemBuilder: (_, index) {
                return InkWell(
                    onLongPress: () {
                      deleteFile(vids.data[index].path);
                    },
                  onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_){
                        return PlayVideo(video: vids.data[index],);
                      }));
                  },
                    child: GridTile(
                      header: Text("$index"),
                      child: Image.network('https://www.phoca.cz/images/projects/phoca-gallery-r.png'),
                      // child: FutureBuilder(
                      //   future: StorageModel().getThumbnail(vids.data[index].path),
                      //   builder: (_, AsyncSnapshot<Uint8List> data){
                      //     if(data.data != null){
                      //       return Image.memory(data.data);
                      //     }else{
                      //       return Center(child: CircularProgressIndicator());
                      //     }
                      //   },
                      // ),
                    ),
                );
              },
            );
          } else {
            return Center(
              child: Text("No Data Yet"),
            );
          }
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
