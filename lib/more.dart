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
                vertical: 30 * heightRatio,
                horizontal: 20 * widthRatio,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 110 * widthRatio,
                        height: 130 * heightRatio,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/harmony.png'), // Replace with your image asset path
                            fit: BoxFit.scaleDown, // You can adjust the fit as needed
                          ),
                          color: AppColors.secondary,
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
                          height: 100 * heightRatio,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
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
                          left: 20 * widthRatio,
                          right: 5 * widthRatio,
                        ),
                        child: Container(
                          width: 60 * widthRatio,
                          height: 60 * heightRatio,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/charity.png'), // Replace with your image asset path
                              fit: BoxFit.scaleDown, // You can adjust the fit as needed
                            ),
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20 * widthRatio,
                          right: 5 * widthRatio,
                          top: 5 * heightRatio,
                        ),
                        child: Container(
                          width: 60 * widthRatio,
                          height: 60 * heightRatio,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
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
              padding: EdgeInsets.only(top: 20 * heightRatio),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20 * widthRatio,
                      bottom: 20 * heightRatio,
                    ),
                    child: Container(
                      width: 110 * widthRatio,
                      height: 100 * heightRatio,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
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
                      width: 110 * widthRatio,
                      height: 150 * heightRatio,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/notebook.png'), // Replace with your image asset path
                          fit: BoxFit.scaleDown, // You can adjust the fit as needed
                        ),
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5 * widthRatio,
                          top: 5 * heightRatio,
                        ),
                        child: Container(
                          width: 60 * widthRatio,
                          height: 60 * heightRatio,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5 * widthRatio,
                          top: 5 * heightRatio,
                        ),
                        child: Container(
                          width: 60 * widthRatio,
                          height: 60 * heightRatio,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
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
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30 * widthRatio,
                    vertical: 10 * heightRatio,
                  ),
                  child: Container(
                    width: 200 * widthRatio,
                    height: 150 * heightRatio,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
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
