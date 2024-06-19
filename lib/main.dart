import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;

  CustomText({super.key, required this.text, required this.color, this.fontsize = 20.0});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        decoration: TextDecoration.none
      ),
    );
  }
}
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Post(title: "AITA for xyzing?", postPreview: "I own 2 donkeys and blah blah blah...",),
                    Post(title: "WHy is reddit just going to all these aita posts. It's. getting out of hand.", postPreview: "As a 39 year old living in my moms basement...",)
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}

class Post extends StatelessWidget {
  final String title;
  final String postPreview;
  Post({super.key, required this.title, required this.postPreview});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 43, 2, 2),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CustomText(text: title, color: Colors.white),
          CustomText(text: postPreview, color: const Color.fromARGB(67, 255, 255, 255),),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "reddit Simplified", color: Color.fromARGB(245, 250, 91, 6), fontsize: 20),
                const Icon(
                  Icons.person_off_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}