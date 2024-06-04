import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/aboutus.dart';
import 'package:myapp/picyefkrgibzhalist.dart';
import 'package:myapp/viewimage.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PicYefkrGibzhaGrid extends StatefulWidget {
  @override
  _PicYefkrGibzhaGridState createState() => _PicYefkrGibzhaGridState();
}

class _PicYefkrGibzhaGridState extends State<PicYefkrGibzhaGrid> {
  late Stream<QuerySnapshot> stream;

  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance
        .collection("yefkrgbzha")
        .orderBy("number", descending: false)
        .snapshots();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      backgroundColor: Colors.black,
      // const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          'Yefeker Gebzha',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            // tooltip: 'Settings',
            enableFeedback: true,
            icon: const Icon(
              CupertinoIcons.list_bullet,
            ),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => PicYefkrGibzhaList(),
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'About Us',
            enableFeedback: true,
            icon: const Icon(
              CupertinoIcons.info_circle,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              );
            },
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        animSpeedFactor: 1,
        // color: Colors.deepPurple[900],
        color: Colors.black,
        backgroundColor: Colors.white,
        showChildOpacityTransition: false,
        height: 40,
        child: Stack(
          children: [
            FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print('connection is successfull');
                    return StreamBuilder(
                        stream: stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            // return const Text("Something went wrong");
                            print("loading");
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return GridView.count(
                              padding: EdgeInsets.all(width / 60),
                              crossAxisCount: columnCount,
                              children: snapshot.data!.docs.map((document) {
                                return Center(
                                  child: InkWell(
                                    child: Container(
                                        // child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: width / 30,
                                            left: width / 60,
                                            right: width / 60),

                                        // margin: const EdgeInsets.all(0),
                                        // width: 165.0,
                                        // decoration: BoxDecoration(),
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            alignment:
                                                FractionalOffset.topCenter,
                                            imageUrl: document['image'],
                                            placeholder: (context, url) =>
                                                Container(
                                              height: width - 20,
                                              width: width,
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 209, 196, 233),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child:
                                                  const CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              height: width - 20,
                                              width: width,
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 209, 196, 233),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: const Icon(Icons.error),
                                            ),
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ViewImage(
                                                  document['image'])));

                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => goto));
                                    },
                                  ),
                                );
                              }).toList());
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
