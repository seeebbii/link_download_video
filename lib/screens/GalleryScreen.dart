import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:link_download_video/galleryScreens/Chingari.dart';
import 'package:link_download_video/galleryScreens/Facebook.dart';
import 'package:link_download_video/galleryScreens/Funimate.dart';
import 'package:link_download_video/galleryScreens/Instagram.dart';
import 'package:link_download_video/galleryScreens/Josh.dart';
import 'package:link_download_video/galleryScreens/Likee.dart';
import 'package:link_download_video/galleryScreens/Moj.dart';
import 'package:link_download_video/galleryScreens/Pinterest.dart';
import 'package:link_download_video/galleryScreens/Rizzle.dart';
import 'package:link_download_video/galleryScreens/Roposo.dart';
import 'package:link_download_video/galleryScreens/ShareChat.dart';
import 'package:link_download_video/galleryScreens/SnackVideo.dart';
import 'package:link_download_video/galleryScreens/TakaTak.dart';
import 'package:link_download_video/galleryScreens/TikTok.dart';
import 'package:link_download_video/galleryScreens/Trell.dart';
import 'package:link_download_video/galleryScreens/Triller.dart';
import 'package:link_download_video/galleryScreens/Twitter.dart';
import 'package:link_download_video/galleryScreens/Vimeo.dart';
import 'package:link_download_video/galleryScreens/Whatsapp.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd(){
    return InterstitialAd(adUnitId: InterstitialAd.testAdUnitId, listener: (MobileAdEvent event){
      print("Interstitial event: $event");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-3940256099942544~3347511713');
    _interstitialAd = createInterstitialAd()..load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Gallery"),
        backgroundColor: Color.fromRGBO(255, 119, 129, 1.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 1000,
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
                                return TikTok(interstitialAd: _interstitialAd,);
                              })).then((value){
                                _interstitialAd = createInterstitialAd()..load();
                              });
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Likee(interstitialAd: _interstitialAd,);
                              })).then((value){
                                _interstitialAd = createInterstitialAd()..load();
                              });
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Facebook(interstitialAd: _interstitialAd,);
                              })).then((value) {
                                _interstitialAd = createInterstitialAd()..load();
                              });
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return Instagram();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Vimeo();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Whatsapp();
                              }));
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return Twitter();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Pinterest();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Rizzle();
                              }));
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return Chingari();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ShareChat();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Josh();
                              }));
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return Moj();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Roposo();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Trell();
                              }));
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return TakaTak();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Triller();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Funimate();
                              }));
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
                            style: TextStyle(fontSize: 13),
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
                                  .push(MaterialPageRoute(builder: (_) {
                                return SnackVideo();
                              }));
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
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
