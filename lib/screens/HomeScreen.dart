import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Video Downloader"
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 600,
          child: Card(
            elevation: 5.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                          fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/sharechat.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("ShareChat", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/instagram.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Instagram", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/facebook.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Facebook", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/whatsapp.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("WhatsApp", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/twitter.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Twitter", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                          child: Image.asset('assets/logo/tik-tok.png', height: 30,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("TikTok", style: TextStyle(
                            fontSize: 18
                        ),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

