import 'dart:io';
import 'dart:typed_data';
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


  Future<List<FileSystemEntity>> getVids() async{
    await StorageModel().getList().then((value) async{
      if(value!=null){
        setState(() {
          files = value;
        });

      }
      else{
        print("No Value");
      }
    });
    return files;
  }

  Future<Widget> getThumbNails(int index) async{

    return Image.memory(await VideoThumbnail.thumbnailData(
      video: files[index].path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 100,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 100,
    ));

    // return fileThumbnail;
  }


  void deleteFile(String path) async{
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
      body: FutureBuilder(
        future: getVids(),
        builder: (BuildContext context ,AsyncSnapshot<List<FileSystemEntity>> vids){
          if(vids.hasData != null){
            return  GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,),
              itemCount: vids.hasData ? vids.data.length : 0,
              itemBuilder: (_, index) {
                return InkWell(
                  onLongPress: (){
                    deleteFile(vids.data[index].path);
                  },
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return PlayVideo(video: vids.data[index],);
                    }));
                  },
                  child: Card(
                    child: GridTile(
                      footer: Text("${vids.data[index].uri}"),
                      child: Text("$index"),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
