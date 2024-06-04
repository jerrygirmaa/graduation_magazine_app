import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PersonalPage extends StatefulWidget {
  late String name, image1, image2, dept, lastword;
  PersonalPage(this.name, this.image1, this.image2, this.dept, this.lastword,
      {Key, key})
      : super(key: key);
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  final _controller2 = PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              // CarouselSlider(
              // SizedBox(
              //   height: width * .1,
              // ),
              SizedBox(
                height: width * 1.23,
                child: PageView(
                  controller: _controller2,
                  children: [
                    Container(
                      child: CachedNetworkImage(
                        imageUrl: widget.image1,
                        placeholder: (context, url) => Container(
                          // width: _w / 2.36,
                          // height: _w / 2.1,
                          width: width,
                          height: width,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 209, 196, 233),
                            // borderRadius: BorderRadius.vertical(
                            //   top: Radius.circular(20),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,

                          child: const CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.all(8.0),
                      // margin: const EdgeInsets.all(8),
                      child: CachedNetworkImage(
                        imageUrl: widget.image2,
                        placeholder: (context, url) => Container(
                          // width: _w / 2.36,
                          // height: _w / 2.1,
                          width: width,
                          height: width,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 209, 196, 233),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,

                          child: const CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                  // options: CarouselOptions(
                  //   height: 550.0,
                  //   enlargeCenterPage: true,
                  //   autoPlay: false,
                  //   aspectRatio: 16 / 9,
                  //   // autoPlayCurve: Curves.fastOutSlowIn,
                  //   enableInfiniteScroll: true,
                  //   // autoPlayAnimationDuration: Duration(milliseconds: 15000),
                  //   viewportFraction: 1,
                  // ),
                ),
              ),
              SizedBox(
                height: width * .06,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller2,
                  count: 2,
                  effect: ScrollingDotsEffect(
                    activeDotColor: Colors.deepPurpleAccent,
                    dotColor: Colors.deepPurple.shade100,
                    spacing: 12,
                    dotHeight: 6,
                    dotWidth: 6,
                    // verticalOffset: 8,
                    // jumpScale: 2
                  ),
                ),
              ),

              Padding(
                padding:
                    EdgeInsets.fromLTRB(width / 17, width / 20, 0, width / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 21,
                        // color: Colors.grey,
                        fontFamily: "JosefinSans",

                        color: Colors.white,
                        // color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: width / 50),
                    Text(
                      widget.dept,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Courgette",
                        color: Colors.deepPurpleAccent,
                        // color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: width / 35),
                    Text(
                      widget.lastword,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontFamily: "Courgette",

                        // color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(height: width / 20),
            ],
          ),

          /// SETTING ICON
          // Padding(
          //   padding: EdgeInsets.fromLTRB(0, width / 9.5, width / 15, 0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       InkWell(
          //         highlightColor: Colors.transparent,
          //         splashColor: Colors.transparent,
          //         // onTap: () {
          //         //   HapticFeedback.lightImpact();
          //         //   Navigator.push(
          //         //     context,
          //         //     MaterialPageRoute(
          //         //       builder: (context) {
          //         //         return RouteWhereYouGo();
          //         //       },
          //         //     ),
          //         //   );
          //         // },
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.all(Radius.circular(99)),
          //           child: BackdropFilter(
          //             filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          //             child: Container(
          //               height: width / 8.5,
          //               width: width / 8.5,
          //               decoration: BoxDecoration(
          //                 color: Colors.black.withOpacity(.05),
          //                 shape: BoxShape.circle,
          //               ),
          //               child: Center(
          //                 child: Icon(
          //                   Icons.settings,
          //                   size: width / 17,
          //                   color: Colors.black.withOpacity(.6),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Blur the Status bar
          // blurTheStatusBar(context),
        ],
      ),
    );
  }

  // Widget blurTheStatusBar(BuildContext context) {
  //   double _w = MediaQuery.of(context).size.width;
  //   return ClipRRect(
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
  //       child: Container(
  //         height: _w / 18,
  //         color: Colors.transparent,
  //       ),
  //     ),
  //   );
  // }
}
