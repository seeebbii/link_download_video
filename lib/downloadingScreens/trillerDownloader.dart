import 'package:flutter/material.dart';

class trillerDownloader extends StatefulWidget {
  @override
  _trillerDownloaderState createState() => _trillerDownloaderState();
}

class _trillerDownloaderState extends State<trillerDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Triller Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for Triller",
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
