import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: const Center(
              child: Text('المراية السحرية'),
            ),
            backgroundColor: Colors.indigo,
          ),
          body: const Center(
            child: MagicBall(),
          ),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int pictureNumber = 0;

  List<String> answers = [
    '',
    'هتموتناااااااي',
    'طب صدقني ما هرد',
    '',
    '',
    '',
    'و حياة خالتك ، دوس اللي بعده',
    'أيوة طبعاااا مستني إيه',
  ];
  void randomAnswers() {
    setState(() {
      pictureNumber = Random().nextInt(7) + 1;

      // ignore: avoid_print
      print(pictureNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        randomAnswers();
      },
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'إسألني سؤال و دوس علي مرايتي السحرية و هقولك تعمل ايه',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/meme2.jpg'),
                ),
              ],
            ),
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.51,
                      child: FittedBox(
                        child: Image.asset('images/meme$pictureNumber.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('images/mirror.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                answers[pictureNumber],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
