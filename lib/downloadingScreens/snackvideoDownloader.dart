import 'package:flutter/material.dart';

class snackvideoDownloader extends StatefulWidget {
  @override
  _snackvideoDownloaderState createState() => _snackvideoDownloaderState();
}

class _snackvideoDownloaderState extends State<snackvideoDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackVideo Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for SnackVideo",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              child: Text("Download"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
