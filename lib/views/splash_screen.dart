import 'package:api_integration_demo/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/cart1.png"),
                  Text(
                    "ꜱʜᴏᴘᴘɪᴇᴇ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
                ],
              ),
            ),
            SliderButton(
              action: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },

              ///Put label over here
              label: Text(
                "Swipe To Shop",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),

              //Put BoxShadow here
              boxShadow: BoxShadow(
                color: Colors.white,
                blurRadius: 4,
              ),

              //Adjust effects such as shimmer and flag vibration here
              shimmer: true,
              vibrationFlag: true,

              ///Change All the color and size from here.
              width: 230,
              radius: 100,
              buttonColor: Colors.black,
              backgroundColor: Colors.amber,
              highlightedColor: Colors.white,
              baseColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
