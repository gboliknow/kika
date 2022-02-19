import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kika/components/color.dart';
import 'package:kika/screens/homescreen.dart';

class Favorites extends StatelessWidget {
  static const route = '/Favorites';
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favorites',
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 18.sp,
            height: 27 / 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Home.route);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 40.w,
              height: 40.h,
              child: Image.asset(
                "assets/images/back.png",
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            BookInfo(
              imgPath: "assets/images/testimage.png",
              title: "Half of a yellow sun",
              Description:
                  "Half of a Yellow Sun is a novel by Nigerian author Chimamanda Ngozi Adichie. Published in 2006 by 4th Estate in London, the novel tells the story of the Biafran War through the perspective of the characters Olanna, Ugwu, and Richard",
              Author: "Chimamanda Ngozi Adichie.",
            ),
            BookInfo(
              imgPath: "assets/images/testimage.png",
              title: "Half of a yellow sun",
              Description:
                  "Half of a Yellow Sun is a novel by Nigerian author Chimamanda Ngozi Adichie. Published in 2006 by 4th Estate in London, the novel tells the story of the Biafran War through the perspective of the characters Olanna, Ugwu, and Richard",
              Author: "Chimamanda Ngozi Adichie.",
            ),
            BookInfo(
              imgPath: "assets/images/testimage.png",
              title: "Half of a yellow sun",
              Description:
                  "Half of a Yellow Sun is a novel by Nigerian author Chimamanda Ngozi Adichie. Published in 2006 by 4th Estate in London, the novel tells the story of the Biafran War through the perspective of the characters Olanna, Ugwu, and Richard",
              Author: "Chimamanda Ngozi Adichie.",
            ),
          ],
        ),
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    this.imgPath,
    this.title,
    this.Author,
    this.Description,
  }) : super(key: key);
  final String? imgPath;
  final String? title;

  final String? Author;
  final String? Description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Image.asset(
            imgPath!,
            width: 104.w,
            height: 140.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12.sp,
                  height: 18 / 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 54.h,
                width: 225.w,
                child: Text(
                  Description!,
                  softWrap: true,
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12.sp,
                    height: 18 / 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Spacer(),
              Text(
                Author!,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 12.sp,
                  height: 18 / 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
