import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kika/screens/auth/login.dart';
import 'package:kika/screens/book_details.dart';
import 'package:kika/screens/favorites.dart';
import 'package:kika/screens/homescreen.dart';
import 'package:kika/screens/onboarding.dart';
import 'package:kika/screens/search.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
            title: 'Kika',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (state) => const Color(0xFF2A87FF)))),
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Poppins',
            ),
            home: AnimatedSplash(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case Onboarding.route:
                  return PageTransition(
                    child: Onboarding(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case Login.route:
                  return PageTransition(
                    child: Login(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case Home.route:
                  return PageTransition(
                    child: Home(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case BookDetails.route:
                  return PageTransition(
                    child: BookDetails(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case BookPreview.route:
                  return PageTransition(
                    child: BookPreview(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case Favorites.route:
                  return PageTransition(
                    child: Favorites(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
                case SearchScreen.route:
                  return PageTransition(
                    child: SearchScreen(),
                    alignment: Alignment.center,
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 800),
                  );
              }
            }));
  }
}

class AnimatedSplash extends StatelessWidget {
  static const route = '/AnimatedSplash';
  const AnimatedSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: SplashScreen(),
      nextScreen: Onboarding(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 2000,
    );
  }
}
