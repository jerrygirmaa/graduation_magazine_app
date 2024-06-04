import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/onboardingscreen.dart';
import 'package:myapp/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool("showHome") ?? false;
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MyApp(showHome: showHome));
}

//
class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: MyCustomUI(),

        // home: MyApp1(),
        // home: PersonalPage1()
        // home: HomePage()
        // home: Ui_2(),
        // home: MyHomePage(),
        // home: ListofGraduates(),
        // home: Gallery(),
        // home: PicTrip(),
        // home: PicGcCommittee(),
        // home: HomePage(),
        // home: MyCustomWidget(),
        // home: ui(),
        // home: PersonalPage(),
        // home: MainList3()
        // home: MyCustomUI()
        home: showHome ? SplashScreen() : OnBoardingScreen());
  }
}
