import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/personalpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ListofGraduates2 extends StatefulWidget {
  final String campusname, campusdescription;
  final int year;
  ListofGraduates2(this.campusname, this.campusdescription,
      {Key, key, required this.year})
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

    String prefix = "";
    if (widget.year != 2014) {
      prefix = "${widget.year - 2013}";
    }
    print(widget.year);

    _streamPeda = FirebaseFirestore.instance
        .collection("${prefix}magazinepeda")
        .orderBy("name", descending: false)
        .snapshots();

    _streamPoly = FirebaseFirestore.instance
        .collection("${prefix}magazinepoly")
        .orderBy("name", descending: false)
        .snapshots();

    _streamSebatamit = FirebaseFirestore.instance
        .collection("${prefix}magazinesebatamit")
        .orderBy("name", descending: false)
        .snapshots();
    _streamSelam = FirebaseFirestore.instance
        .collection("${prefix}magazineselam")
        .orderBy("name", descending: false)
        .snapshots();

    _streamYibab = FirebaseFirestore.instance
        .collection("${prefix}magazineyibab")
        .orderBy("name", descending: false)
        .snapshots();

    _streamZenzelma = FirebaseFirestore.instance
        .collection("${prefix}magazinezenzelima")
        .orderBy("name", descending: false)
        .snapshots();
    _streamMekele = FirebaseFirestore.instance
        .collection("${prefix}magazinemekele")
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
                              break;
                            case "Poly Campus":
                              x = _streamPoly;
                              break;
                            case "Sebatamit Campus":
                              x = _streamSebatamit;
                              break;
                            case "Selam Campus":
                              x = _streamSelam;
                              break;
                            case "Yibab Campus":
                              x = _streamYibab;
                              break;
                            case "Zenzelima Campus":
                              x = _streamZenzelma;
                              break;
                            case "Mekele University":
                              x = _streamMekele;
                              break;
                          }

                          return StreamBuilder(
                              stream: x,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
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
  }

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
          width: width / 2.25,
          height: width / 1.58,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: width / 2.25,
                height: width / 1.8,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 196, 233),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
