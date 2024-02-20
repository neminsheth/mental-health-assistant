import 'package:flutter/material.dart';
import 'package:ipd/colors.dart';
import 'package:ipd/feed/pomodoro.dart';
import 'package:ipd/feed/quotes.dart';
import 'package:ipd/feed/sleep/sleep_tracker_view.dart';
import 'package:ipd/feed/todo.dart';
import 'meditate.dart';
import 'music.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Define the original design dimensions
    const double originalWidth = 390.0;
    const double originalHeight = 900.0;

    // Calculate width and height ratios
    final double widthRatio = size.width / originalWidth;
    final double heightRatio = size.height / originalHeight;

    return Scaffold(
      backgroundColor: Color(0xFF7591B5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 30 * heightRatio),
            Opacity(
              opacity: 0.5,
              child: Text(
                'IPD Project',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25 * widthRatio,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'YOUR MENTAL HEALTH PARTNER',
                  style: TextStyle(
                    fontSize: 16 * widthRatio,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40 * heightRatio,
                horizontal: 20 * widthRatio,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //studymusic
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MeditateScreen()), // Replace ToDoListPage with your actual page class
                          );// Re
                        },
                        child: Container(
                          width: 120 * widthRatio,
                          height: 180 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/meditation.png'),
                              fit: BoxFit.scaleDown,
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => studymusic()), // Replace ToDoListPage with your actual page class
                          );// Replace with your navigation logic for Mental Health
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20 * widthRatio,
                            right: 20 * widthRatio,
                          ),
                          child: Container(
                            width: 110 * widthRatio,
                            height: 150 * heightRatio,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage('assets/icons/mental-health.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          // Replace with your navigation logic for Charity
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 5 * widthRatio,
                          ),
                          child: Container(
                            width: 70 * widthRatio,
                            height: 70 * heightRatio,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/charity.png'),
                                fit: BoxFit.scaleDown,
                              ),
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PomodoroTimer()), // Replace ToDoListPage with your actual page class
                          );
                          // Replace with your navigation logic for Brain Games
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 5 * widthRatio,
                            top: 25 * heightRatio,
                          ),
                          child: Container(
                            width: 70 * widthRatio,
                            height: 70 * heightRatio,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/brain_games.JPG'),
                                fit: BoxFit.contain,
                              ),
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10 * heightRatio),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ToDoListPage()), // Replace ToDoListPage with your actual page class
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20 * widthRatio,
                            bottom: 30 * heightRatio,
                          ),
                          child: Container(
                            width: 120 * widthRatio,
                            height: 120 * heightRatio,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/to-do-list.png'),
                                fit: BoxFit.contain,
                              ),
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Replace with your navigation logic for Journal
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10 * widthRatio,
                          vertical: 10 * heightRatio,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 110 * widthRatio,
                                height: 150 * heightRatio,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/icons/notebook.png',
                                  width: 80 * widthRatio,
                                  height: 70 * heightRatio,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SleepTrackerView()), // Replace ToDoListPage with your actual page class
                            );
                            // Replace with your navigation logic for Podcast
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 4 * widthRatio,
                              top: 5 * heightRatio,
                            ),
                            child: Container(
                              width: 70 * widthRatio,
                              height: 70 * heightRatio,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/podcast.JPG'),
                                  fit: BoxFit.contain,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuotePage()), // Replace ToDoListPage with your actual page class
                          );
                            // Replace with your navigation logic for Self Help
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 4 * widthRatio,
                              top: 25 * heightRatio,
                            ),
                            child: Container(
                              width: 70 * widthRatio,
                              height: 70 * heightRatio,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/hand.JPG'),
                                  fit: BoxFit.contain,
                                ),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    // Replace with your navigation logic for Reading
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20 * widthRatio,
                      bottom: 20 * heightRatio,
                    ),
                    child: Container(
                      width: 110 * widthRatio,
                      height: 130 * heightRatio,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/reading.JPG'),
                          fit: BoxFit.contain,
                        ),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Replace with your navigation logic for Yoga
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30 * widthRatio,
                      vertical: 30 * heightRatio,
                    ),
                    child: Container(
                      width: 200 * widthRatio,
                      height: 150 * heightRatio,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/yoga (1).png'),
                          fit: BoxFit.contain,
                        ),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
