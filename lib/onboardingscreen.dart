import 'package:flutter/material.dart';
import 'package:myapp/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 75, 44, 161),
                      color: Colors.white70,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/cloud-computing.png"),
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            Expanded(
                flex: 3,
                child: Column(children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 2,
                        child: const Text(
                          "You need an internet connection when you open the app for the first time. Only the pages you open will be loaded.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,

                              // fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  // const Expanded(
                  //   // flex: 8,
                  //   child: SizedBox(
                  //     height: 10,
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 40, left: 40),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[900],
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool("showHome", true);

                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        child: const Text('Get Started'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
