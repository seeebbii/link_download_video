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
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
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
                labelStyle: TextStyle(
                  color: Color.fromRGBO(171, 63, 65, 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(171, 63, 65, 1.0),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(171, 63, 65, 1.0),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text("Download"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Color.fromRGBO(171, 63, 65, 1.0);
                    return Color.fromRGBO(
                        255, 119, 129, 1.0); // Use the component's default.
                  },
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
