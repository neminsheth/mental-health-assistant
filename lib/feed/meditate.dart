import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipd/feed/feed.dart';

import '../colors.dart';
import '../general/music_tile.dart';
import '../home.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({Key? key}) : super(key: key);

  @override
  _MeditateScreenState createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  late CountDownController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: AppColors.secondaryblue,
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MEDITATE',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CircularCountDownTimer(
                duration: 2700,
                initialDuration: 0,
                controller: _controller,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                ringColor: Colors.white,
                fillColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                strokeWidth: 3.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onComplete: () {
                  print('Countdown Completed');
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.pause();
                    },
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.start();
                    },
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.restart(duration: 2700);
                    },
                    icon: Icon(Icons.replay),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                ],
              ),
              SizedBox(height: 60),
              MusicTile(
                title: 'Rainfall',
                length: '30:00',
                isLocked: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
  AppBar appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 25,
            width: 25,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      title: const Text(
        'Pomodoro!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
