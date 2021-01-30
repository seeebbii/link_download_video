import 'package:flutter/material.dart';

class sharechatDownloader extends StatefulWidget {
  @override
  _sharechatDownloaderState createState() => _sharechatDownloaderState();
}

class _sharechatDownloaderState extends State<sharechatDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShareChat Downloader"),
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fieldController,
              decoration: InputDecoration(
                labelText: "Enter Link for ShareChat",
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
            SizedBox(
              height: 15.0,
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
