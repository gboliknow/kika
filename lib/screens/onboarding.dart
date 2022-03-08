import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kika/components/appbutton.dart';
import 'package:kika/screens/auth/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            HexColor("#EA9E2C").withOpacity(0.93),
            HexColor("#EA9E2C").withOpacity(0.60),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 52.w,
              height: 20.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Kika',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 60.sp,
                height: 90 / 60,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'The Book App',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24.sp,
                height: 36 / 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  static const route = '/Onboarding';
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pana.png",
                width: 270.w,
                height: 210.h,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Read amazing book from top authors in you convinient space',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: HexColor("#222222"),
                  fontSize: 16.sp,
                  height: 24 / 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              AppButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Login.route);
                },
                buttonText: "Get Started",
                backgroundColor: HexColor("#EA9E2C"),
                textColor: HexColor("#F2F2F2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
