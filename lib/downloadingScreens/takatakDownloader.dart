import 'package:flutter/material.dart';

class takatakDownloader extends StatefulWidget {
  @override
  _takatakDownloaderState createState() => _takatakDownloaderState();
}

class _takatakDownloaderState extends State<takatakDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TakaTak Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for TakaTak",
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
