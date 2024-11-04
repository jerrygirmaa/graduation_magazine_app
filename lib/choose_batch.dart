import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:myapp/homepage.dart';

class ChooseBatch extends StatefulWidget {
  const ChooseBatch({super.key});

  @override
  State<ChooseBatch> createState() => _ChooseBatchState();
}

class _ChooseBatchState extends State<ChooseBatch> {
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
          child: Column(children: <Widget>[
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
                          "BDU Christian Students Fellowship\n                  Graduates",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xffF5F5F5),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 50.0)
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Choose Batch",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 15.0),
              ),
            ),
            yearButton(
                2014,
                const HomePage(
                  year: 2014,
                )),
            yearButton(
                2015,
                const HomePage(
                  year: 2015,
                )),
            yearButton(
                2016,
                const HomePage(
                  year: 2016,
                )),
          ]),
        ),
      ),
    );
  }

  yearButton(year, goto) {
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
                    image: const DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/icons/graduate.png"),
                      fit: BoxFit.contain,
                    ),
                    color: const Color.fromARGB(255, 209, 196, 233),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              const SizedBox(width: 10.0),
              Text(
                "$year",
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => goto));
        },
      ),
    );
  }
}
