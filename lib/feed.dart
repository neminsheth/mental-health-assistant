import 'package:flutter/material.dart';
import 'package:ipd/colors.dart';
import 'package:video_thumbnail_imageview/video_thumbnail_imageview.dart';

import 'general/emoticon_card.dart';
import 'general/excercise.dart';
import 'general/youtube.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'How do you feel ?',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  EmoticonCard(
                    emoticonFace: '😔',
                    mood: 'Badly',
                  ),
                  EmoticonCard(
                    emoticonFace: '😊',
                    mood: 'Fine',
                  ),
                  EmoticonCard(
                    emoticonFace: '😁',
                    mood: 'Well',
                  ),
                  EmoticonCard(
                    emoticonFace: '😃',
                    mood: 'Excellent',
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exercises',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Add any actions related to Exercises here
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust the alignment as needed
                  children: const [
                    ExerciseTile(
                      exercise: 'Speaking Skills',
                      subExercise: '16 Exercises',
                      icon: Icons.favorite,
                      color: Colors.orange,
                    ),
                    ExerciseTile(
                      exercise: 'Reading Speed',
                      subExercise: '8 Exercises',
                      icon: Icons.person,
                      color: Colors.pink,
                    ),
                    ExerciseTile(
                      exercise: 'Speaking Skills',
                      subExercise: '16 Exercises',
                      icon: Icons.umbrella,
                      color: Colors.red,
                    ),
                    ExerciseTile(
                      exercise: 'Speaking Skills',
                      subExercise: '16 Exercises',
                      icon: Icons.book,
                      color: Colors.yellow,
                    ),
                    ExerciseTile(
                      exercise: 'Speaking Skills',
                      subExercise: '16 Exercises',
                      icon: Icons.music_note,
                      color: Colors.pink,
                    ),
                    ExerciseTile(
                      exercise: 'Speaking Skills',
                      subExercise: '16 Exercises',
                      icon: Icons.mobile_friendly,
                      color: Colors.green,
                    ),
                    // Add more ExerciseTile widgets here
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Videos',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add any actions related to Videos here
                ],
              ),
              SizedBox(
                height: 220,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      VideoThumbnailContainer(
                        videoUrl: "https://youtu.be/uinxopMRhJY?si=XcMHoLVLBlj-b6im",
                        width: 150.0,
                        height: 100.0,
                      ),
                      SizedBox(width: 10),
                      VideoThumbnailContainer(
                        videoUrl: "https://youtu.be/uinxopMRhJY?si=XcMHoLVLBlj-b6im",
                        width: 150.0,
                        height: 100.0,
                      ),
                      SizedBox(width: 10),
                      VideoThumbnailContainer(
                        videoUrl: "https://youtu.be/uinxopMRhJY?si=XcMHoLVLBlj-b6im",
                        width: 150.0,
                        height: 100.0,
                      ),
                      SizedBox(width: 10),
                      VideoThumbnailContainer(
                        videoUrl: "https://youtu.be/uinxopMRhJY?si=XcMHoLVLBlj-b6im",
                        width: 150.0,
                        height: 100.0,
                      ),
                      SizedBox(width: 10),
                      VideoThumbnailContainer(
                        videoUrl: "https://youtu.be/uinxopMRhJY?si=XcMHoLVLBlj-b6im",
                        width: 150.0,
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//