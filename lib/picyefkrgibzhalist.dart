import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/aboutus.dart';
import 'package:myapp/picyefkrgibzhagrid.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PicYefkrGibzhaList extends StatefulWidget {
  @override
  _PicYefkrGibzhaListState createState() => _PicYefkrGibzhaListState();
}

class _PicYefkrGibzhaListState extends State<PicYefkrGibzhaList> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      // Color(0xffF5F5F5),
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
              CupertinoIcons.square_list,
            ),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => PicYefkrGibzhaGrid(),
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
        child: Center(
            child: FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print('connection is successfull');
                    return StreamBuilder(
                        stream: stream,
                        // stream: FirebaseFirestore.instance
                        //     .collection("magazinepoly")
                        //     .orderBy("name", descending: true)
                        //     .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            // return const Text("Something went wrong");
                            print("loading");
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((document) {
                                print("aginchewalehu gn data yelewmko");
                                return Center(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5, top: 7),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: CachedNetworkImage(
                                          imageUrl: document['image'],
                                          placeholder: (context, url) =>
                                              Container(
                                            height: width - 20,
                                            width: width,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 209, 196, 233),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child:
                                                const CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            height: width - 20,
                                            width: width,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 209, 196, 233),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.error),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList());
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })),
      ),

      // top me rahna
      // CustomPaint(
      //   painter: MyPainter(),
      //   child: Container(height: 0),
      // ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint_1 = Paint()
//       // Color(0xffF57752)
//       ..color = Colors.deepPurple
//       ..style = PaintingStyle.fill;

//     Path path_1 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width * .1, 0)
//       ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

//     Path path_2 = Path()
//       ..moveTo(size.width, 0)
//       ..lineTo(size.width * .9, 0)
//       ..cubicTo(
//           size.width * .95, 0, size.width, 20, size.width, size.width * .08);

//     Paint paint_2 = Paint()
//       ..color = Colors.deepPurple
//       ..strokeWidth = 1
//       ..style = PaintingStyle.stroke;

//     Path path_3 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0);

//     canvas.drawPath(path_1, paint_1);
//     canvas.drawPath(path_2, paint_1);
//     canvas.drawPath(path_3, paint_2);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
