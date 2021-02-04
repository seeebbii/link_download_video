import 'package:flutter/material.dart';

class trellDownloader extends StatefulWidget {
  @override
  _trellDownloaderState createState() => _trellDownloaderState();
}

class _trellDownloaderState extends State<trellDownloader> {
  final fieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trell Downloader"),
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
                  labelText: "Enter Link for Trell",
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
