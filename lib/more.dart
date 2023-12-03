import 'package:flutter/material.dart';
import 'package:ipd/colors.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Define the original design dimensions
    const double originalWidth = 390.0;
    const double originalHeight = 844.0;

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
                      Container(
                        width: 120 * widthRatio,
                        height: 180 * heightRatio,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/meditation.png'), // Replace with your image asset path
                            fit: BoxFit.scaleDown, // You can adjust the fit as needed
                          ),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
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
                              image: AssetImage('assets/icons/mental-health.png'), // Replace with your image asset path
                              fit: BoxFit.contain, // You can adjust the fit as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          //left: 20 * widthRatio,
                          right: 5 * widthRatio,
                        ),
                        child: Container(
                          width: 70 * widthRatio,
                          height: 70 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/charity.png'), // Replace with your image asset path
                              fit: BoxFit.scaleDown, // You can adjust the fit as needed
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          //left: 0 * widthRatio,
                          right: 5 * widthRatio,
                          top: 25 * heightRatio,
                        ),
                        child: Container(
                          width: 70 * widthRatio,
                          height: 70 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/brain_games.JPG'), // Replace with your image asset path
                              fit: BoxFit.contain, // You can adjust the fit as needed
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10 * heightRatio),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20 * widthRatio,
                      bottom: 30 * heightRatio,
                    ),
                    child: Container(
                      width: 120 * widthRatio,
                      height: 120 * heightRatio,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/to-do-list.png'), // Replace with your image asset path
                          fit: BoxFit.contain, // You can adjust the fit as needed
                        ),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
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
                              width: 80 * widthRatio, // Adjust the width as needed
                              height: 70 * heightRatio, // Adjust the height as needed
                              fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                            ),
                          ),
                        ),
                        // const Positioned(
                        //   bottom: 2, // Adjust the spacing between the image and text
                        //   child: Text(
                        //     'Your Text Here',
                        //     style: TextStyle(
                        //       fontFamily: 'Poppins',
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.bold,
                        //       color: AppColors.secondary,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4 * widthRatio,
                          top: 5 * heightRatio,
                        ),
                        child: Container(
                          width: 70 * widthRatio,
                          height: 70 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/podcast.JPG'), // Replace with your image asset path
                              fit: BoxFit.contain, // You can adjust the fit as needed
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4 * widthRatio,
                          top: 25 * heightRatio,
                        ),
                        child: Container(
                          width: 70 * widthRatio,
                          height: 70 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/hand.JPG'), // Replace with your image asset path
                              fit: BoxFit.contain, // You can adjust the fit as needed
                            ),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20 * widthRatio,
                    bottom: 20 * heightRatio,
                  ),
                  child: Container(
                    width: 110 * widthRatio,
                    height: 130 * heightRatio,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/reading.JPG'), // Replace with your image asset path
                        fit: BoxFit.contain, // You can adjust the fit as needed
                      ),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30 * widthRatio,
                    vertical: 30 * heightRatio,
                  ),
                  child: Container(
                    width: 200 * widthRatio,
                    height: 150 * heightRatio,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/yoga (1).png'), // Replace with your image asset path
                        fit: BoxFit.contain, // You can adjust the fit as needed
                      ),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
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
