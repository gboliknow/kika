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
      height: 155.h,
      width: 104.w,
      margin: EdgeInsets.only(left: 10.w),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
              child: Image.network(
                imgPath!,
                width: 104.w,
                height: 140.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: 104.w,
              child: Text(
                title!,
                maxLines: 1,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 10.sp,
                  height: 12 / 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // SizedBox(
            //   height: 3.h,
            // ),
            // Expanded(
            //   child: Text(
            //     Author!,
            //     style: GoogleFonts.poppins(
            //       color: primaryColor,
            //       fontSize: 12.sp,
            //       height: 14 / 12,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
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
          Image.network(
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
              Container(
                width: 225.w,
                child: Text(
                  title!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12.sp,
                    height: 18 / 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                Author!,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 12.sp,
                  height: 18 / 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 225.w,
                child: Text(
                  Description!,
                  softWrap: true,
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 10.sp,
                    height: 18 / 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
