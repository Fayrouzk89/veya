import 'package:flutter/material.dart';
import '../../Helper/ImageAssetsHelper.dart';
import 'SplashController.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  SplashController? pageController;
  late AnimationController _controller1;
  late AnimationController _controller2;

  late Animation<double> _image1PositionAnimation;
  late Animation<double> _image2PositionAnimation;
  double valController1=0.6;
  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds:2,milliseconds: 1500),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1,),
    );

    // Add listener to _controller1
    _controller1.addListener(() {
      if (_controller1.value >= valController1) {
        setState(() {
        });
        // Start second animation when the first image reaches the quarter
        if (!_controller2.isAnimating) {
          _controller2.forward();
        }
      }
    });
    pageController=SplashController();
    pageController!.authenticate(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;
    ImageAssetsHelper.imageHeight1=screenWidth*0.16;
    ImageAssetsHelper.imageHeight2=ImageAssetsHelper.imageHeight1/3;
    // Define animations for image 1 and image 2
    _image1PositionAnimation = Tween<double>(
      begin: -200, // Start off-screen
      end: screenWidth / 2 - (ImageAssetsHelper.imageHeight1 / 2), // Center of the screen
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    ));

    _image2PositionAnimation = Tween<double>(
      begin: screenWidth / 2 - (screenWidth/8), // Start near the center
      end: screenWidth / 2+10, // Center of the screen
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));

    // Start the first animation
    _controller1.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // First image animation
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                top: (MediaQuery.of(context).size.height / 2)-ImageAssetsHelper.imageHeight1, // Fixed vertical position
                left: _image1PositionAnimation.value,
                child:ImageAssetsHelper.getImageAssets(ImageAssetsHelper.right,ImageAssetsHelper.imageHeight1,ImageAssetsHelper.imageHeight1)
              );
            },
          ),

          (_controller1.value >= valController1)?
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Positioned(
                top:  (MediaQuery.of(context).size.height / 2)-ImageAssetsHelper.imageHeight1+(ImageAssetsHelper.imageHeight1-ImageAssetsHelper.imageHeight2), // Same vertical position
                left: _image2PositionAnimation.value,
                child: ImageAssetsHelper.getImageAssets(ImageAssetsHelper.left,ImageAssetsHelper.imageHeight2,ImageAssetsHelper.imageHeight2),
              );
            },
          ):Container(),
        ],
      ),
    );
  }



}