import 'dart:math';

import 'package:flutter/material.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import '../../Helper/ImageAssetsHelper.dart';

class AnimatedPageWidget extends StatelessWidget {
  final PageController pageController;
  final bool isLeft;
  final double screenWidth;
  final Function(bool) callPressIcon;

  AnimatedPageWidget({
    required this.pageController,
    required this.isLeft,
    required this.screenWidth,
    required this.callPressIcon,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the text direction
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        final page = pageController.page ?? 1.0;
        final offset = (1.0-page) * (screenWidth / 2 - 40)* (isRTL ? -1 : 1);
        const startColor = Color(0xFFc3c0c0); // Light black
        const endColor = Color(0xFF000000);   // Dark black

        double pageColor = page;
        if (!isLeft && page != 1) {
          pageColor = 2 - page.abs();
        }
        if (!LocalDataHelper.getLang()&&(isLeft && page != 1)) {
          pageColor = 2 - page.abs();
        }


// Apply an easing function (e.g., quadratic easing)
         double darknessProgress = (1.0 - pageColor.abs()).clamp(0.0, 1.0);
// Exaggerate the effect using a power function for non-linear interpolation
         double enhancedDarkness = pow(darknessProgress, 2).toDouble();
        if(enhancedDarkness==0)
          {
            darknessProgress = (1.0 - page.abs()).clamp(0.0, 1.0);
            enhancedDarkness = pow(darknessProgress, 2).toDouble();
          }
        final overlayColor = Color.lerp(startColor, endColor, enhancedDarkness);
        String imageSrc=ImageAssetsHelper.getImagePathMain(isLeft,page);
        return Transform.translate(
          offset: Offset(offset, 0), // Adjusted horizontal translation
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(ImageAssetsHelper.imagePadding + 10),
                child: GestureDetector(
                  onTap: () {
                    callPressIcon(isLeft);
                  },
                  child:
                  ((LocalDataHelper.getLang()&&( isLeft&& page==0))
                  ||(!LocalDataHelper.getLang()&&( !isLeft&&page==0))
                  )?
                  Image.asset(
                    imageSrc, // Replace with your asset
                    //color: overlayColor?.withOpacity(1),
                    fit: BoxFit.contain,
                  ):
                  Image.asset(
                    imageSrc, // Replace with your asset
                    color: overlayColor?.withOpacity(1),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
