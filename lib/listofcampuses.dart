import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/aboutus.dart';
import 'package:myapp/listofgraduates.dart';

class ListofCampuses extends StatefulWidget {
  @override
  _ListofCampusesState createState() => _ListofCampusesState();
}

class _ListofCampusesState extends State<ListofCampuses>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

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

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xffF5F5F5),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          'Graduation Magazine',
          style: TextStyle(fontSize: 16, color: Color(0xffF5F5F5)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'About Us',
            enableFeedback: true,
            icon: const Icon(
              CupertinoIcons.info_circle,
            ),
            color: const Color(0xffF5F5F5),
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
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: width / 13),
              cards("Peda Campus", "Main Campus", Colors.deepPurple.shade100,
                  "assets/icons/graduate.png"),
              cards(
                  "Poly Campus",
                  "Bahirdar Institute of Tech",
                  const Color.fromARGB(255, 158, 229, 255),
                  "assets/icons/graduate.png"),
              cards("Sebatamit Campus", "Health campus",
                  Colors.deepPurple.shade100, "assets/icons/graduate.png"),
              cards(
                  "Selam Campus",
                  "Institute of Textile and Fashion",
                  const Color.fromARGB(255, 158, 229, 255),
                  "assets/icons/graduate.png"),
              cards("Yibab Campus", "School of Law", Colors.deepPurple.shade100,
                  "assets/icons/graduate.png"),
              cards(
                  "Zenzelima Campus",
                  "Agri Campus",
                  const Color.fromARGB(255, 158, 229, 255),
                  "assets/icons/graduate.png"),
              cards("Mekele University", "Mekele Institute of Tech",
                  Colors.deepPurple.shade100, "assets/icons/graduate.png"),
            ],
          ),

          // top me rahna
          CustomPaint(
            painter: MyPainter(),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }

  Widget cards(campus, campusdescription, color, img) {
    double width = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListofGraduates2(campus, campusdescription),
                ));
          },
          highlightColor: const Color.fromRGBO(0, 0, 0, 0),
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(width / 20, width / 20, width / 20, 0),
            padding: EdgeInsets.all(width / 20),
            height: width / 4.4,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: const Color(0xffEDECEA),
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: width / 15,
                  child:
                      // const FlutterLogo(size: 30),
                      Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          opacity: 0.3,
                          image: AssetImage(img),
                          fit: BoxFit.contain,
                        ),
                        // color: color,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        campus,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          // fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      Text(
                        campusdescription,
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Colors.black.withOpacity(.8),
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.navigate_next_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      // Color(0xffF57752)
      ..color = Colors.deepPurple.shade900
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Colors.deepPurple.shade900
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
