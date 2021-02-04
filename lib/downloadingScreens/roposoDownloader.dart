import 'package:flutter/material.dart';

class roposoDownloader extends StatefulWidget {
  @override
  _roposoDownloaderState createState() => _roposoDownloaderState();
}

class _roposoDownloaderState extends State<roposoDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roposo Downloader"),
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: fieldController,
                decoration: InputDecoration(
                  labelText: "Enter Link for Roposo",
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
      ),
    );
  }
}
