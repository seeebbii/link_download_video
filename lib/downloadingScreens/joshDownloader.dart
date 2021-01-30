import 'package:flutter/material.dart';

class joshDownloader extends StatefulWidget {
  @override
  _joshDownloaderState createState() => _joshDownloaderState();
}

class _joshDownloaderState extends State<joshDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Josh Downloader"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for Josh",
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
