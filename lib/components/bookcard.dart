import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kika/components/color.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    this.imgPath,
    this.title,
    this.Author,
  }) : super(key: key);

  final String? imgPath;
  final String? title;
  final String? Author;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: 104.w,
      margin: EdgeInsets.only(right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imgPath!,
            width: 104.w,
            height: 140.h,
          ),
          Text(
            title!,
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: 10.sp,
              height: 12 / 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            Author!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: primaryColor,
              fontSize: 12.sp,
              height: 14 / 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
