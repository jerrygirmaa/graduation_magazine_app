import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  AboutUsState createState() => AboutUsState();
}

class AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final Uri telegram = Uri.parse("https://t.me/bdu_fellowship");
    final Uri instagram =
        Uri.parse("https://www.instagram.com/bdu_fellowship_vlm/");
    // final Uri facebook = Uri.parse("https://fb.me/BDU-Fellowship-VLM");
    final Uri facebook = Uri.parse("https://www.facebook.com/bdufellowship");

    final Uri youtube =
        Uri.parse("https://www.youtube.com/@bahirdaruniversityfellowsh5667");
    final Uri gmail =
        Uri.parse("https://mail.google.com/mail/u/0/#inbox?compose=new");

    final Uri telegram1 = Uri.parse("https://t.me/mintesinotteferamt");
    final phoneno = Uri.parse('tel:+251932213918');

    return Scaffold(
      // backgroundColor: Colors.white,

      backgroundColor: const Color.fromARGB(255, 237, 235, 235),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: height * .46,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                // color: Colors.green.shade500,
                // color: Colors.cyan.shade800,

                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                  // GridView.count(
                  //     crossAxisCount: 3,
                  //     physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height:
                                        MediaQuery.of(context).size.width / 8,

                                    // margin: const EdgeInsets.only(
                                    //     left: 38.0, right: 38),
                                    decoration: const BoxDecoration(
                                      // color: Colors.green.shade700,
                                      // color: Colors.cyan.shade900,

                                      // borderRadius: BorderRadius.circular(20),
                                      // ignore: prefer_const_constructors
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/VLM_logo_for_bright_background-01.png"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height:
                                        MediaQuery.of(context).size.width / 8,
                                    // margin: const EdgeInsets.only(
                                    //     left: 38.0, right: 38),
                                    decoration: const BoxDecoration(
                                      // color: Colors.green.shade700,
                                      // color: Colors.cyan.shade900,

                                      // borderRadius: BorderRadius.circular(20),
                                      // ignore: prefer_const_constructors
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/VLM_logo_for_bright_background-01.png"),
                                        // image: NetworkImage(
                                        //     "https://thumbs.dreamstime.com/b/old-farm-house-29449434.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height:
                                        MediaQuery.of(context).size.width / 8,
                                    // margin: const EdgeInsets.only(
                                    //     left: 38.0, right: 38),
                                    decoration: const BoxDecoration(
                                      // color: Colors.green.shade700,
                                      // color: Colors.cyan.shade900,

                                      // borderRadius: BorderRadius.circular(20),
                                      // ignore: prefer_const_constructors
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/VLM_logo_for_bright_background-01.png"),
                                        // image: NetworkImage(
                                        //     "https://thumbs.dreamstime.com/b/old-farm-house-29449434.jpg"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )))
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 8,
                                  // margin: const EdgeInsets.only(
                                  //     left: 38.0, right: 38),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(20),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/VLM_logo_for_bright_background-01.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 6.5,
                                  height:
                                      MediaQuery.of(context).size.width / 6.5,
                                  // margin: const EdgeInsets.only(
                                  //     left: 35.0, right: 35),

                                  // padding: const EdgeInsets.all(10.0),
                                  // margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(10),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/bdufellow.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 8,
                                  // margin: const EdgeInsets.only(
                                  //     left: 38.0, right: 38),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(20),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/VLM_logo_for_bright_background-01.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 8,
                                  // margin: const EdgeInsets.only(
                                  //     left: 38.0, right: 38),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(20),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/VLM_logo_for_bright_background-01.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 8,
                                  // margin: const EdgeInsets.only(
                                  //     left: 38.0, right: 38),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(20),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/VLM_logo_for_bright_background-01.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  height: MediaQuery.of(context).size.width / 8,
                                  // margin: const EdgeInsets.only(
                                  //     left: 38.0, right: 38),
                                  decoration: const BoxDecoration(
                                    // color: Colors.green.shade700,
                                    // color: Colors.cyan.shade900,

                                    // borderRadius: BorderRadius.circular(20),
                                    // ignore: prefer_const_constructors
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/VLM_logo_for_bright_background-01.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  )))
                        ],
                      ),
                    )
                  ]),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       alignment: Alignment.topRight,
              //       padding: EdgeInsets.all(35),
              //       child: CircleAvatar(
              //         backgroundColor: Colors.white.withOpacity(0.4),
              //         child: const Icon(
              //           Icons.bookmark_remove_outlined,
              //           color: Colors.white70,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Card(
              // elevation: 1,
              color: Colors.white70,
              child: SizedBox(
                height: height * .26,
                width: MediaQuery.of(context).size.width / 1.5 + 130,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: const Text(
                          "Follow Us",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: const Icon(
                              Icons.location_on_outlined,
                              size: 0,
                              color: Colors.lightBlue,
                            )),
                        const Text(
                          "BDU Fellowship VLM",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        // const Icon(
                        //   Icons.star_rate_rounded,
                        //   color: Colors.yellow,
                        // ),
                        // const Text(
                        //   "4.3",
                        //   style: TextStyle(fontWeight: FontWeight.w500),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .057,
                                // MediaQuery.of(context).size.height * .07,
                                width:
                                    MediaQuery.of(context).size.height * .057,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade200
                                      .withOpacity(.5),
                                  // color: Colors.lightBlueAccent.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.telegram_outlined,
                                  color: Colors.deepPurple.shade300,
                                  // color: Colors.green.shade700,
                                  size: 23,
                                ),
                              ),
                              onTap: () async {
                                if (!await launchUrl(telegram,
                                    mode: LaunchMode.externalApplication)) {
                                  throw 'Could not launch ';
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Text(
                              "telegram",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .057,
                                // MediaQuery.of(context).size.height * .07,
                                width:
                                    MediaQuery.of(context).size.height * .057,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade200
                                      .withOpacity(.5),
                                  // color: Colors.lightBlueAccent.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Color.fromARGB(255, 149, 117, 205),
                                  size: 22,
                                ),
                              ),
                              onTap: () async {
                                if (!await launchUrl(instagram,
                                    mode: LaunchMode.externalApplication)) {
                                  throw 'Could not launch ';
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Text(
                              "instagram",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .057,
                                  // MediaQuery.of(context).size.height * .07,
                                  width:
                                      MediaQuery.of(context).size.height * .057,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade200
                                        .withOpacity(.5),

                                    // color: Colors.lightBlueAccent.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.facebook_outlined,
                                    color: Colors.deepPurple.shade300,

                                    // color: Colors.green.shade700,
                                    size: 22,
                                  ),
                                ),
                                onTap: () async {
                                  if (!await launchUrl(facebook,
                                      mode: LaunchMode.externalApplication)) {
                                    throw 'Could not launch ';
                                  }
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Text(
                              "facebook",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .057,
                                    // MediaQuery.of(context).size.height * .07,
                                    width: MediaQuery.of(context).size.height *
                                        .057,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade200
                                          .withOpacity(.5),
                                      // color:Colors.lightBlueAccent.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.youtube,
                                      color: Color.fromARGB(255, 149, 117, 205),
                                      size: 19,
                                    )),
                                onTap: () async {
                                  if (!await launchUrl(youtube,
                                      mode: LaunchMode.externalApplication)) {
                                    throw 'Could not launch ';
                                  }
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            const Text(
                              "youtube",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Card(
              // elevation: 1,
              child: Container(
                color: Colors.deepPurple.shade200.withOpacity(.3),
                height: height * .11,
                width: MediaQuery.of(context).size.width / 1.5 + 130,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20, top: 12),
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.telegram_outlined,
                                      color: Colors.deepPurple.shade300,
                                      // color: Colors.green.shade700,
                                      size: 18,
                                    ),
                                  ),
                                  GestureDetector(
                                      child: const Text(
                                        "@mintesinotteferamt",
                                        style: TextStyle(
                                            fontFamily: "JosefinSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap: () async {
                                        if (!await launchUrl(telegram1,
                                            mode: LaunchMode
                                                .externalApplication)) {
                                          throw 'Could not launch ';
                                        }
                                      }),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.deepPurple.shade300,
                                    // color: Colors.green.shade700,
                                    size: 18,
                                  ),
                                ),
                                GestureDetector(
                                    child: const Text(
                                      "0932213918",
                                      style: TextStyle(
                                          fontFamily: "JosefinSans",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () async {
                                      if (!await launchUrl(phoneno,
                                          mode:
                                              LaunchMode.externalApplication)) {
                                        throw 'Could not launch ';
                                      }
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }

  // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  //   primary: Colors.white,
  //   backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: 16.0),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(10)),
  //   ),
  // );
}
