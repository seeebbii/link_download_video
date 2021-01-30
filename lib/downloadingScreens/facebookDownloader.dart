import 'package:flutter/material.dart';

class facebookDownloader extends StatefulWidget {
  @override
  _facebookDownloaderState createState() => _facebookDownloaderState();
}

class _facebookDownloaderState extends State<facebookDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for Facebook",
                border: OutlineInputBorder(),
              ),
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
