import 'package:flutter/material.dart';
import 'package:flutteronboarding/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var pages = [
    PageViewModel(
      title: "Rumah Kos/Kontrakan",
      body: "Silahkan Mencari Rumah Kos/Kontrakan Di Sini...",
      image: Center(
        child: ClipOval(
          child: Image(
            height: 210.0,
            width: 210.0,
            image: AssetImage("assets/images/rumah.png"),
            fit: BoxFit.cover,
          ) ,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
      ),
    ),

    PageViewModel(
      title: "Jual Beli Rumah",
      body: "Yang ingin menjual atau membeli rumah, silahkan dilihat Disini..",
      image: Center(
        child: ClipOval(
              child: Image(
              height: 200.0,
              width: 200.0,
              image: AssetImage("assets/images/rumah2.jpg"),
              fit: BoxFit.cover,
              ) ,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
      ),
    ),

    PageViewModel(
      title: "Tanah Kapling",
      body: "Yang ingin mencari tanah untuk rumah, silahkan dilihat disini...",
      image: Center(
        child: ClipOval(
          child: Image(
            height: 200.0,
            width: 200.0,
            image: AssetImage("assets/images/kapling.png"),
            fit: BoxFit.cover,
          ) ,
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          // When done button is press
          Navigator.pushReplacement(context,
            MaterialPageRoute( builder: (context) => HomePage()),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
          Navigator.pushReplacement(context,
            MaterialPageRoute( builder: (context) => HomePage()),
          );
        },
        showSkipButton: true,
        skip:Icon(Icons.skip_next),
        next: Icon(Icons.arrow_right),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepPurple,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
      ),
    );
  }
}
