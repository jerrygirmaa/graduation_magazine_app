import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:myapp/listofcampuses.dart';
import 'package:myapp/personalpage.dart';
import 'package:myapp/picgoodbyegrid.dart';
import 'package:myapp/picfamilygrid.dart';
import 'package:myapp/picgccommitteegrid.dart';
import 'package:myapp/picdinnerfasikagrid.dart';
import 'package:myapp/pictripgrid.dart';
import 'package:myapp/picyefkrgibzhagrid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<QuerySnapshot> _streamStudents;
  // late Future<QuerySnapshot> _futureStudents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamStudents = FirebaseFirestore.instance
        .collection("topscorers")
        .orderBy("number", descending: false)
        .snapshots();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        animSpeedFactor: 1,
        color: Colors.deepPurple[900],
        backgroundColor: Colors.white,
        showChildOpacityTransition: false,
        height: 50,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClip(),
                child: Container(
                  height: 200.0,
                  color: Colors.deepPurple[900],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 25.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 0.5,
                                    image: AssetImage(
                                        "assets/icons/mortarboard.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  // color: const Color.fromARGB(255, 209, 196, 233),
                                  color: Colors.deepPurple[900],
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 0.5,
                                    image: AssetImage(
                                        "assets/icons/mortarboard.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  // color: const Color.fromARGB(255, 209, 196, 233),
                                  color: Colors.deepPurple[900],
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    opacity: 0.5,
                                    image: AssetImage(
                                        "assets/icons/mortarboard.png"),
                                    fit: BoxFit.contain,
                                  ),
                                  // color: const Color.fromARGB(255, 209, 196, 233),
                                  color: Colors.deepPurple[900],
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),

                        const Center(
                          child: Text(
                            "BDU Christian Students Fellowship\n             2021/2022 Graduates",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xffF5F5F5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(20.0),
                        //   ),
                        //   height: 45.0,
                        //   margin: const EdgeInsets.symmetric(
                        //       horizontal: 34.0, vertical: 30.0),
                        //   // child: const TextField(
                        //   //   decoration: InputDecoration(
                        //   //     border: InputBorder.none,
                        //   //     enabledBorder: InputBorder.none,
                        //   //     focusedBorder: InputBorder.none,
                        //   //     hintText: "Search for the best",
                        //   //     hintStyle: TextStyle(color: Colors.deepPurple),
                        //   //     contentPadding: EdgeInsets.symmetric(
                        //   //         horizontal: 16.0, vertical: 14.0),
                        //   //     suffixIcon: Icon(
                        //   //       Icons.search,
                        //   //       size: 14.0,
                        //   //       color: Colors.grey,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        // ),
                        const SizedBox(height: 50.0)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "Top scorers and Awardees",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 15.0),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontSize: 13.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 215.0,
                child: FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context, snapshot1) {
                      // if (snapshot.connectionState == ConnectionState.done) {
                      //   print('connection is successfull');
                      return StreamBuilder<QuerySnapshot>(
                          stream: _streamStudents,
                          // initialData: ,
                          // future: _futureStudents,
                          builder: (context, snapshot) {
                            // if (!snapshot.hasError) {
                            //   return const Center(
                            //       child: Text("Check your internet connection"));
                            // } else
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator()),
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator()),
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator())
                                ],
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              QuerySnapshot? querySnapshot = snapshot.data;
                              List<QueryDocumentSnapshot>
                                  listQueryDocumentSnapshot =
                                  querySnapshot!.docs;
                              print("now done");
                              print("done and has data");
                              return ListView.builder(
                                  // children: snapshot.data!.docs.map((document) {

                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listQueryDocumentSnapshot.length,
                                  itemBuilder: (context, index) {
                                    QueryDocumentSnapshot document =
                                        listQueryDocumentSnapshot[index];
                                    return Center(
                                        child: getItem(
                                            document['image1'],
                                            PersonalPage(
                                                document["name"],
                                                document['image1'],
                                                document['image2'],
                                                document['department'],
                                                document['lastword'])));
                                  });
                            } else if (snapshot.connectionState ==
                                    ConnectionState.active &&
                                snapshot.hasData) {
                              QuerySnapshot? querySnapshot = snapshot.data;
                              List<QueryDocumentSnapshot>
                                  listQueryDocumentSnapshot =
                                  querySnapshot!.docs;
                              print("now active");
                              print("active and has data");
                              return ListView.builder(
                                  // children: snapshot.data!.docs.map((document) {

                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listQueryDocumentSnapshot.length,
                                  itemBuilder: (context, index) {
                                    QueryDocumentSnapshot document =
                                        listQueryDocumentSnapshot[index];
                                    return Center(
                                        child: getItem(
                                            document['image1'],
                                            PersonalPage(
                                                document["name"],
                                                document['image1'],
                                                document['image2'],
                                                document['department'],
                                                document['lastword'])));
                                  });
                            } else {
                              return ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ListView(
                                          children: const <Widget>[
                                            Icon(Icons.error),
                                            SizedBox(height: 20),
                                            Text(
                                              "Turn off your internet connection and restart your app",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ListView(
                                          children: const <Widget>[
                                            Icon(Icons.error),
                                            SizedBox(height: 20),
                                            Text(
                                              "Turn off your internet connection and restart your app",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.all(2.0),
                                      width: 170.0,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 196, 233),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: ListView(
                                          children: const <Widget>[
                                            Icon(Icons.error),
                                            SizedBox(height: 20),
                                            Text(
                                              "Turn off your internet connection and restart your app",
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              );
                            }
                          });
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              getSmallItem("assets/icons/graduate.png", 9, "Magazine",
                  "Graduation - Aug 27, 2022", ListofCampuses()),
              getSmallItem("assets/icons/eating.png", 1.2, "GC Dinner Fasika",
                  "Apr 22, 2022", PicDinnerFasikaGrid()),
              getSmallItem("assets/icons/dinner.png", 10.7, "GC Good Bye",
                  "Jul 23, 2022", PicGoodByeGrid()),
              getSmallItem("assets/icons/hiking.png", 3, "Tisabay Trip",
                  "Aug 22, 2022", PicTripGrid()),
              getSmallItem("assets/icons/eating.png", 5.7, "YeFeker Gebezha",
                  "Apr 02, 2022", PicYefkrGibzhaGrid()),
              getSmallItem("assets/icons/family.png", 2, "Family Pictures", "",
                  PicFamilyGrid()),
              getSmallItem("assets/icons/gccommittee.png", 2.7, "GC Committee",
                  "Jul 17, 2022", PicGCCommitteeGrid()),
              // MyCustomUI2()
            ],
          ),
        ),
      ),
    );
  }

  getSmallItem(img, size, name, date, goto) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.3,
                        image: AssetImage(img),
                        fit: BoxFit.contain,
                      ),
                      color: const Color.fromARGB(255, 209, 196, 233),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$name",
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "$date",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 20.0),
                ClipPath(
                  clipper: MyClip2(),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    color: Colors.deepPurple[900],
                    child: Center(
                      child: Text(
                        "$size mb",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color:
                                // Colors.black87
                                Color.fromARGB(255, 209, 196, 233)
                            // Color.fromARGB(179, 195, 60, 60)
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ListofCampuses()))

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => goto));
          },
        ));
  }

  getItem(img, goto) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.all(2.0),
          width: 170.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: img,
                placeholder: (context, url) => Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 196, 233),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()),
                errorWidget: (context, url, error) => Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 209, 196, 233),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.error)),
              ))
          // decoration: BoxDecoration(
          //     color: Colors.deepPurple,
          //     image: const DecorationImage(
          //       image: AssetImage("assets/images/temu1.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //     borderRadius: BorderRadius.circular(10.0)),
          ),
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => ListofCampuses()))

        Navigator.push(context, MaterialPageRoute(builder: (context) => goto));
      },
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 50.0);
    path.quadraticBezierTo(
        size.width - 70.0, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width / 3.0, size.height - 32, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(10, size.height / 2 + 20, 5, size.height / 2);
    path.quadraticBezierTo(0, size.height / 3, 10, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
