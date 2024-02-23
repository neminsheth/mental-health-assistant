import 'package:flutter/material.dart';
import 'package:ipd/colors.dart';
import 'package:ipd/feed/books/book_screen.dart';
import 'package:ipd/feed/pomodoro.dart';
import 'package:ipd/feed/quotes.dart';
import 'package:ipd/feed/sleep/sleep_tracker_view.dart';
import 'package:ipd/feed/todo.dart';
import 'exercise/workout_tracker_view.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                  vertical: 120 * heightRatio,
                  horizontal: 20 * widthRatio,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActivityIcon(
                          'Meditation',
                          'assets/icons/meditation.png',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MeditateScreen()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Mental Health',
                          'assets/icons/mental-health.png',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => studymusic()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Brain Games',
                          'assets/icons/brain_games.JPG',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PomodoroTimer()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                      ],
                    ),
                    SizedBox(height: 20 * heightRatio),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActivityIcon(
                          'To-Do List',
                          'assets/icons/to-do-list.png',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ToDoListPage()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Journal',
                          'assets/icons/notebook.png',
                              () {
                            // Navigate to journal page
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Podcast',
                          'assets/icons/podcast.JPG',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SleepTrackerView()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                      ],
                    ),
                    SizedBox(height: 20 * heightRatio),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActivityIcon(
                          'Self Help',
                          'assets/icons/hand.JPG',
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QuotePage()),
                                );
                            // Navigate to self-help page
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Reading',
                          'assets/icons/reading.JPG',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => bookScreen()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                        _buildActivityIcon(
                          'Yoga',
                          'assets/icons/yoga (1).png',
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WorkoutTrackerView()),
                            );
                          },
                          widthRatio,
                          heightRatio,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityIcon(String title, String imagePath, Function() onTap, double widthRatio, double heightRatio) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(5.0), // Add padding here
        child: Container(
          width: 105 * widthRatio,
          height: 140 * heightRatio, // Adjusted height to accommodate the text
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5), // Adjust the spacing between the image and text
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
