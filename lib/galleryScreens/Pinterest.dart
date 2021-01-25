import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:link_download_video/directory/storage.dart';
import 'package:link_download_video/screens/PlayVideo.dart';
class Pinterest extends StatefulWidget {
  @override
  _PinterestState createState() => _PinterestState();
}

class _PinterestState extends State<Pinterest> {
  List<FileSystemEntity> files;
  List<Uint8List> fileThumbnail;

  Future<List<FileSystemEntity>> getVids() async {
    await StorageModel().getPinterestList().then((value) async {
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
        title: Text("Pinterest"),
      ),
      body: FutureBuilder(
        future: getVids(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FileSystemEntity>> vids) {
          if (vids.data != null) {
            return GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: vids.hasData ? vids.data.length : 0,
              itemBuilder: (_, index) {
                return InkWell(
                  onLongPress: () {
                    deleteFile(vids.data[index].path);
                  },
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return PlayVideo(
                        video: vids.data[index],
                      );
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
          } else {
            return Center(
              child: Text("No Data Yet"),
            );
          }
        },
      ),
    );
  }
}
