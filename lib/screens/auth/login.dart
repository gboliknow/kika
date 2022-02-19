import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kika/components/appbutton.dart';
import 'package:kika/components/color.dart';
import 'package:kika/components/textformfield.dart';
import 'package:kika/screens/homescreen.dart';

class Login extends StatelessWidget {
  static const route = '/Login';
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Image.asset(
                "assets/images/logo2.png",
                width: 55.w,
                height: 20.h,
              ),
              Text(
                'Kika',
                style: GoogleFonts.poppins(
                  color: HexColor("#EA9E2C"),
                  fontSize: 60.sp,
                  height: 90 / 60,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 24.sp,
                  height: 36 / 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              TextFieldWithTitle(
                title: "Email",
                hint: "Email Address",
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFieldWithTitle(
                title: "Password",
                hint: "Password",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/password.png",
                    width: 19.w,
                    height: 14.h,
                  ),
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              AppButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Home.route);
                },
                buttonText: "Sign In",
                backgroundColor: HexColor("#EA9E2C"),
                textColor: HexColor("#F2F2F2"),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'Don\'t Have an Account?',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    height: 24 / 16,
                    color: textColor,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Text(
                'Or',
                style: GoogleFonts.poppins(
                  color: textColor.withOpacity(0.6),
                  fontSize: 16.sp,
                  height: 24 / 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
