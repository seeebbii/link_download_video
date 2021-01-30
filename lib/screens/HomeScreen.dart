import 'package:flutter/material.dart';
import 'package:link_download_video/downloadingScreens/LikeeDownloader.dart';
import 'package:link_download_video/downloadingScreens/TikTokDownloader.dart';
import 'package:link_download_video/main.dart';
import 'package:link_download_video/screens/GalleryScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.photo,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return GalleryScreen();
              }));
            },
          )
        ],
        title: Text("All Video Downloader"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 1000,
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return TikTokDownloader();
                                }));
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/tik-tok.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "TikTok",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return LikeeDownloader();
                                }));
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Likee.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Likee",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/sharechatDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/sharechat.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ShareChat",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/chingariDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Chingari.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Chingari",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/funimateDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Funimate.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Funimate",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/joshDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/josh.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Josh",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("/mojDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Moj.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Moj",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/pinterestDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Pinterest.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pinterest",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/rizzleDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Rizzle.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rizzle",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/instagramDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/instagram.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Instagram",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/facebookDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/facebook.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/whatsappDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/whatsapp.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "WhatsApp",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/twitterDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/twitter.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Twitter",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/roposoDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Roposo.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Roposo",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/snackvideoDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/snackVideo.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "SnackVideo",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/takatakDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/takaTak.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Taka Tak",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/trillerDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Triller.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Triller",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/vimeoDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Vimeo.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Vimeo",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/trellDownload");
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/Trell.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Trell",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Card(
                elevation: 5.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return GalleryScreen();
                                }));
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: Image.asset(
                                  'assets/logo/gallery.png',
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
