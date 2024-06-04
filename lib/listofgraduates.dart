import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/personalpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ListofGraduates2 extends StatefulWidget {
  final String campusname, campusdescription;
  ListofGraduates2(this.campusname, this.campusdescription, {Key, key})
      : super(key: key);
  @override
  _ListofGraduates2State createState() => _ListofGraduates2State();
}

class _ListofGraduates2State extends State<ListofGraduates2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Stream<QuerySnapshot> _streamPeda;
  late Stream<QuerySnapshot> _streamPoly;
  late Stream<QuerySnapshot> _streamSebatamit;
  late Stream<QuerySnapshot> _streamSelam;
  late Stream<QuerySnapshot> _streamYibab;
  late Stream<QuerySnapshot> _streamZenzelma;
  late Stream<QuerySnapshot> _streamMekele;

  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    _streamPeda = FirebaseFirestore.instance
        .collection("magazinepeda")
        .orderBy("name", descending: false)
        .snapshots();

    _streamPoly = FirebaseFirestore.instance
        .collection("magazinepoly")
        .orderBy("name", descending: false)
        .snapshots();

    _streamSebatamit = FirebaseFirestore.instance
        .collection("magazinesebatamit")
        .orderBy("name", descending: false)
        .snapshots();
    _streamSelam = FirebaseFirestore.instance
        .collection("magazineselam")
        .orderBy("name", descending: false)
        .snapshots();

    _streamYibab = FirebaseFirestore.instance
        .collection("magazineyibab")
        .orderBy("name", descending: false)
        .snapshots();

    _streamZenzelma = FirebaseFirestore.instance
        .collection("magazinezenzelima")
        .orderBy("name", descending: false)
        .snapshots();
    _streamMekele = FirebaseFirestore.instance
        .collection("magazinemekele")
        .orderBy("name", descending: false)
        .snapshots();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var x;
    return Scaffold(
        // backgroundColor: Color(0xffF5F5F5),
        backgroundColor: Colors.black,
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          animSpeedFactor: 1,
          // color: Colors.deepPurple[900],
          color: Colors.black,
          backgroundColor: Colors.white,
          showChildOpacityTransition: false,
          height: 40,
          child: Stack(children: [
            ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width / 17, width / 20, 0, width / 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.campusname,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white.withOpacity(.9),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // SizedBox(height: _w / 35),
                        Text(
                          widget.campusdescription,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: Firebase.initializeApp(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          print('connection is successfull');
                          switch (widget.campusname) {
                            case "Peda Campus":
                              x = _streamPeda;
                              // do something
                              break;
                            case "Poly Campus":
                              x = _streamPoly;
                              // do something
                              break;
                            case "Sebatamit Campus":
                              x = _streamSebatamit;
                              // do something
                              break;
                            case "Selam Campus":
                              x = _streamSelam;
                              // do something
                              break;
                            case "Yibab Campus":
                              x = _streamYibab;
                              // do something
                              break;
                            case "Zenzelima Campus":
                              x = _streamZenzelma;
                              // do something
                              break;
                            case "Mekele University":
                              x = _streamMekele;
                              // do something
                              break;
                          }

                          return StreamBuilder(
                              stream: x,
                              // stream: FirebaseFirestore.instance
                              //     .collection("magazinepoly")
                              //     .orderBy("name", descending: true)
                              //     .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  // return const Text("Something went wrong");
                                  // print("loading");
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return GridView.count(
                                    childAspectRatio: .75,
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children:
                                        snapshot.data!.docs.map((document) {
                                      // print("aginchewalehu gn data yelewmko");
                                      return Center(
                                          child: card(
                                              document['name'],
                                              document['image1'],
                                              PersonalPage(
                                                  document["name"],
                                                  document['image1'],
                                                  document['image2'],
                                                  document['department'],
                                                  document['lastword'])));

                                      // Text(
                                      //     "mintesinot Tefera Tantu Oyato Asga" +
                                      //         document["name"]);
                                    }).toList());
                              });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })
                ])
          ]),
        ));

    // settingIcon(),
  }

//   Widget settingIcon() {
//     double _w = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.fromLTRB(0, _w / 10, _w / 20, 0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             height: _w / 8.5,
//             width: _w / 8.5,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(.1),
//                   blurRadius: 30,
//                   offset: Offset(0, 15),
//                 ),
//               ],
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               tooltip: 'Settings',
//               icon: Icon(Icons.settings,
//                   size: _w / 17, color: Colors.black.withOpacity(.6)),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MyFadeRoute(
//                     route: PersonalPage(),
//                     page: PersonalPage(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget searchBar() {
//     double _w = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             height: _w / 8.5,
//             width: _w / 1.36,
//             padding: EdgeInsets.symmetric(horizontal: _w / 60),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(99),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(.1),
//                   blurRadius: 30,
//                   offset: Offset(0, 15),
//                 ),
//               ],
//             ),
//             child: TextField(
//               maxLines: 1,
//               decoration: InputDecoration(
//                 fillColor: Colors.transparent,
//                 filled: true,
//                 hintStyle: TextStyle(
//                     color: Colors.black.withOpacity(.4),
//                     fontWeight: FontWeight.w600,
//                     fontSize: _w / 22),
//                 prefixIcon:
//                     Icon(Icons.search, color: Colors.black.withOpacity(.6)),
//                 hintText: 'Search anything.....',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none),
//                 contentPadding: EdgeInsets.zero,
//               ),
//             ),
//           ),
//           SizedBox(height: _w / 14),
//           Container(
//             width: _w / 1.15,
//             child: Text(
//               'Example Text',
//               textScaleFactor: 1.4,
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black.withOpacity(.7),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

  Widget card(String name, String image, Widget route) {
    double width = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(MyFadeRoute(route: route, page: route));
        },
        child: Container(
          // width: _w / 2.36,
          // height: _w / 1.8,
          width: width / 2.25,
          height: width / 1.58,
          decoration: BoxDecoration(
            // color: Color.fromARGB(255, 209, 196, 233),

            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                // width: _w / 2.36,
                // height: _w / 2.1,
                width: width / 2.25,
                height: width / 1.8,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 196, 233),
                  // Color(0xff5C71F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: image,
                  // progressIndicatorBuilder: (_, url, download) {
                  //   if (download.progress != null) {
                  //     final percent = download.progress! * 100;
                  //     return Text("$percent% done loading");
                  //   }
                  //   return Text("Loaded $url");
                  // },
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                // child: Image(image: NetworkImage(image))
                // NetworkImage(image
                //     // "assets/images/4F9A9481a.jpg"
                //     ),
                // child: const Text(
                //   'Add image here',
                //   textScaleFactor: 1.2,
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
              Container(
                height: width / 14,
                width: width / 2.36,
                padding: EdgeInsets.symmetric(horizontal: width / 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textScaleFactor: 1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
