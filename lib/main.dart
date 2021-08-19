import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parallax",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double imgRateZero = 0;
  double imgRateOne = 0;
  double imgRateTwo = 0;
  double imgRateThree = 0;
  double imgRateFour = 0;
  double imgRateFive = 0;
  double imgRateSix = 0;
  double imgRateSeven = 0;
  double imgRateEight = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff210002),
      body: NotificationListener(
        onNotification: (sc) {
          if (sc is ScrollUpdateNotification) {
            setState(() {
              imgRateEight -= sc.scrollDelta! / 1;
              imgRateSeven -= sc.scrollDelta! / 1.5;
              imgRateSix -= sc.scrollDelta! / 2;
              imgRateFive -= sc.scrollDelta! / 2.5;
              imgRateFour -= sc.scrollDelta! / 3;
              imgRateThree -= sc.scrollDelta! / 3.5;
              imgRateTwo -= sc.scrollDelta! / 4;
              imgRateOne -= sc.scrollDelta! / 4.5;
              imgRateZero -= sc.scrollDelta! / 5;
            });
          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(top: imgRateZero, asset: "parallax0"),
            ParallaxWidget(top: imgRateOne, asset: "parallax1"),
            ParallaxWidget(top: imgRateTwo, asset: "parallax2"),
            ParallaxWidget(top: imgRateThree, asset: "parallax3"),
            ParallaxWidget(top: imgRateFour, asset: "parallax4"),
            ParallaxWidget(top: imgRateFive, asset: "parallax5"),
            ParallaxWidget(top: imgRateSix, asset: "parallax6"),
            ParallaxWidget(top: imgRateSeven, asset: "parallax7"),
            ParallaxWidget(top: imgRateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: 600,
                  color: Colors.transparent,
                ),
                Container(
                  color: const Color(0xff210002),
                  width: MediaQuery.of(context).size.width,
                  height: 1500,
                  padding: const EdgeInsets.only(top: 70),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "FLUTTER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Poppins",
                                letterSpacing: 1.8,
                                color: Color(0xffffaf00)),
                          ),
                          const Text(
                            "PARALLAX",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 48,
                                fontFamily: "Poppins",
                                letterSpacing: 1.8,
                                color: const Color(0xffffaf00)),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                child: const Divider(
                                  height: 1,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffffaf00),
                                ),
                                child: const Divider(
                                  height: 1,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: const Divider(
                                  height: 1,
                                  color: const Color(0xffffaf00),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Made By",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                              letterSpacing: 1.3,
                              color: const Color(0xffffaf00),
                            ),
                          ),
                          const Text(
                            "XamDesign",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              letterSpacing: 1.8,
                              color: const Color(0xffffaf00),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key? key,
    required this.top,
    required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
