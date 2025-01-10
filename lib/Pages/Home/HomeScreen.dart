import 'package:flutter/material.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import '../../Helper/ImageAssetsHelper.dart';
import '../../Utils/style.dart';
import '../Messenger/MessengerScreen.dart';
import '../UserInfo/UserInfoScreen.dart';
import '../WorkOutScreen/workoutScreen.dart';
import 'AnimatedPageWidget.dart';
import 'HomeConsts.dart';
import 'SlideUpRoute.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final PageController _pageController = PageController(initialPage:HomeConsts.homePage);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Remove listener to avoid memory leaks
    _pageController.dispose();
    super.dispose();
  }

  bool isMsg=false;
  bool isExercise=false;
  Widget buildIcon(String path)
  {
   return IconButton(
      icon: Image.asset(
        path, // Path to your asset image
        height: 30, // Adjust size as needed
        width: 30,
      ),
      onPressed: () {
        changePage(HomeConsts.homePage);
        print('Icon button pressed!');
      },
    );
  }
  changePage(int page)
  {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  callPressIcon(bool isLeft)
  {
    if(LocalDataHelper.getLang())
      {
    if(isLeft)
      {
        changePage(HomeConsts.msgPage);
      }
    else
      {
        changePage(HomeConsts.exercisePage);
      }
      }
    else
      {
        if(isLeft)
        {
          changePage(HomeConsts.exercisePage);
        }
        else
        {
          changePage(HomeConsts.msgPage);
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // If not on the home page, navigate back within the PageView
        if (_pageController.page != 1) {
          _pageController.animateToPage(
            1, // Navigate back to the home page
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          return false; // Prevent popping the screen
        }
        return true; // Allow popping the screen
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainBackground,
          leading: Padding(
            padding:  EdgeInsets.all(ImageAssetsHelper.imagePadding),
            child:  Row(
              children: [
                !isExercise?getImageAnimated(LocalDataHelper.getLang(),screenWidth):Container(width: 1,),
                isExercise?buildIcon(LocalDataHelper.getLang()?ImageAssetsHelper.arrowBack:ImageAssetsHelper.arrow):Container()
              ],
            )
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.all(ImageAssetsHelper.imagePadding),
              child: getImageAnimated(!LocalDataHelper.getLang(),screenWidth),
            ),
            isMsg?buildIcon(LocalDataHelper.getLang()?ImageAssetsHelper.arrow:ImageAssetsHelper.arrowBack):Container()
          ],
        ),
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int page) {
            print("Page changed to: $page");
            if(page==HomeConsts.exercisePage)
              {isExercise=true;
              isMsg=false;
              setState(() {
              });
              }
            else if(page==HomeConsts.msgPage)
              {
                isMsg=true;
                isExercise=false;
                setState(() {

                });
              }
            else
              {
                if(isMsg)
                  {
                    isMsg=false;
                    setState(() {

                    });
                  }
                if(isExercise)
                  {
                    isExercise=false;
                    setState(() {

                    });
                  }
              }
          },
          children:
          LocalDataHelper.getLang()?
          [
            MessengerScreen(), // Swiping left navigates here
            HomePage(),       // Home Screen (default)
            WorkoutScreen(), // Swiping right navigates here
          ]:[
            WorkoutScreen(), // Swiping right navigates here
            HomePage(),       // Home Screen (default)
            MessengerScreen(), // Swiping left navigates here
          ],
        ),
      ),
    );
}

  Widget getImageAnimated(bool isLeft,double screenWidth)
  {
    return AnimatedPageWidget(pageController: _pageController, isLeft: isLeft, screenWidth: screenWidth, callPressIcon: (bool ) {
      callPressIcon(isLeft);
    },);
  }

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          Navigator.push(
            context,
            SlideUpRoute(UserInfoScreen()), // Use the custom page route
          );
        }
      },
      child: Scaffold(
        backgroundColor: mainBackground,

        body: Stack(
          children: [
            // Main content of the screen
            const Center(
              child: Text(
                '',
              ),
            ),

            // Placeholder at the bottom of the screen
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
               // padding: EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(
                  ImageAssetsHelper.placeholder, // Replace with your image path
                  //height: 60, // Fixed height
                  fit: BoxFit.cover, // Ensures the image covers the full width
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}





