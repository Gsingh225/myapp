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
                    Post(title: "AITA for xyzing?", postPreview: "I own 2 donkeys and blah blah blah...", postContent: "My husband insists on washing his dishes in the bathtub. He claims it's more efficient and saves water. Meanwhile, I'm convinced he's secretly a hobbit who's trying to recreate the Shire in our bathroom. Every evening, I brace myself for the sound of pots and pans clanging against porcelain, followed by his cheerful whistling. I've considered staging an intervention, but honestly, his dedication to this bizarre ritual is kind of endearing. Plus, the bathtub is sparkling clean.",),
                    Post(title: "WHy is reddit just going to all these aita posts. It's. getting out of hand.", postPreview: "As a 39 year old living in my moms basement...", postContent: "AITA for charging my neighbor for the electricity their kid used while playing video games at my house? I'm a single mom working two jobs, and my electric bill is already high. This kid is over here every day, running up my bill. I tried talking to the parents, but they just laughed it off. So, I started charging them a gaming fee. They're outraged, but I don't feel bad. Am I the jerk?",)
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

class PostDetailsScreen extends StatelessWidget {
  final String title;
  final String postContent;

  PostDetailsScreen({required this.title, required this.postContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),), //temp tes
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Text(postContent), //again just a test to see if nav works
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final String title;
  final String postPreview;
  final String postContent;
  Post({super.key, required this.title, required this.postPreview, required this.postContent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailsScreen(title: title, postContent: postContent)
          )
        );
      },
      child: Container(
        color: Color.fromARGB(255, 43, 2, 2),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            CustomText(text: title, color: Colors.white),
            CustomText(text: postPreview, color: const Color.fromARGB(67, 255, 255, 255),),
          ],
        ),
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