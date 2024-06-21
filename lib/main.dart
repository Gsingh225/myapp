import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Comment {
  final String author;
  final String txt;
  final String timestamp; //its gonna be all ai gen so dont rlly need datetime

  Comment({required this.author, required this.txt, this.timestamp = '06-09-1969'});
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final bool bold;
  final int? maxLines;
  final TextOverflow? overflow;

  CustomText({super.key, required this.text, this.color = Colors.white, this.fontsize = 20.0, this.bold = false, this.maxLines, this.overflow});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        decoration: TextDecoration.none,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
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
                    Post(title: "AITA for xyzing?", postPreview: "I own 2 donkeys and blah blah blah blah blah blah blah blah blah...", postContent: "My husband insists on washing his dishes in the bathtub. He claims it's more efficient and saves water. Meanwhile, I'm convinced he's secretly a hobbit who's trying to recreate the Shire in our bathroom. Every evening, I brace myself for the sound of pots and pans clanging against porcelain, followed by his cheerful whistling. I've considered staging an intervention, but honestly, his dedication to this bizarre ritual is kind of endearing. Plus, the bathtub is sparkling clean.", comments: [Comment(author: 'FlutterFan123', txt: 'Great tutorial! Really helped me understand state management.', timestamp: '03-15-2024'), Comment(author: 'CodeNinja', txt: 'Has anyone tried implementing this with GetX?', timestamp: '03-16-2024'), Comment(author: 'DartMaster', txt: 'The explanation of async/await was spot on. Thanks!', timestamp: '03-17-2024')],),
                    Post(title: "WHy is reddit just going to all these aita posts. It's. getting out of hand.", postPreview: "As a 39 year old living in my moms basement...", postContent: "AITA for charging my neighbor for the electricity their kid used while playing video games at my house? I'm a single mom working two jobs, and my electric bill is already high. This kid is over here every day, running up my bill. I tried talking to the parents, but they just laughed it off. So, I started charging them a gaming fee. They're outraged, but I don't feel bad. Am I the jerk?", comments: [Comment(author: 'MobileDevPro', txt: 'How would this perform on older devices?', timestamp: '03-18-2024'), Comment(author: 'UIDesigner', txt: 'Love the clean UI! Can you share the color palette?', timestamp: '03-19-2024'), Comment(author: 'BugHunter', txt: 'Found a small typo in the code snippet at 3:45. Otherwise, perfect!', timestamp: '03-20-2024'), Comment(author: 'FlutterNewbie', txt: 'This helped me finally understand Streams. Thank you!', timestamp: '03-21-2024'), Comment(author: 'PerformanceGuru', txt: 'Have you considered using const constructors for better performance?', timestamp: '03-22-2024'), Comment(author: 'CrossPlatformDev', txt: 'How different would this be in React Native? Any major changes?', timestamp: '03-23-2024')],)
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
  final List<Comment> comments;

  PostDetailsScreen({required this.title, required this.postContent, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8), child: CustomText(text: title, color: Colors.white, fontsize: 22,),),
                  Container(margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8), child: CustomText(text: postContent, color: Colors.white, fontsize: 18,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_alt_outlined),
                        onPressed: () {
                          print("thumbs up"); //placeholder
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.thumb_down_alt_outlined),
                        onPressed: () {
                          print("thumbs down"); //placeholder
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: () {
                          print("comment"); //placeholder
                        },
                      ),
                    ],
                  ),
                  if (comments.isNotEmpty)
                  Column(
                    children: comments.map((comment) => CommentView(comment: comment)).toList()
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class CommentView extends StatelessWidget {
  final Comment comment;

  CommentView({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: comment.author, bold: true, fontsize: 14, maxLines: 1, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 1,),
          CustomText(text: comment.timestamp, color: Color.fromARGB(255, 128, 128, 128), fontsize: 10, maxLines: 1, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 4,),
          CustomText(text: comment.txt, fontsize: 12, color: Color.fromARGB(255, 211, 211, 211), maxLines: null,)
        ],
      ),
    );
  }

}

class Post extends StatelessWidget {
  final String title;
  final String postPreview;
  final String postContent;
  final List<Comment> comments;
  
  Post({super.key, required this.title, required this.postPreview, required this.postContent, this.comments = const []});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailsScreen(title: title, postContent: postContent, comments: comments)
          )
        );
      },
      child: Container(
        color: Color.fromARGB(255, 43, 2, 2),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            CustomText(text: title, color: Colors.white),
            CustomText(text: postPreview, color: const Color.fromARGB(67, 255, 255, 255),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  onPressed: () {
                    print("thumbs up"); //placeholder
                  },
                ),
                IconButton(
                  icon: Icon(Icons.thumb_down_alt_outlined),
                  onPressed: () {
                    print("thumbs down"); //placeholder
                  },
                ),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline),
                  onPressed: () {
                    print("comment"); //placeholder
                  },
                ),
              ],
            )
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
// FIX COMMENTS SECTION ISSUE