import 'package:flutter/material.dart';

class funimateDownloader extends StatefulWidget {
  @override
  _funimateDownloaderState createState() => _funimateDownloaderState();
}

class _funimateDownloaderState extends State<funimateDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funimate Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for Funimate",
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
