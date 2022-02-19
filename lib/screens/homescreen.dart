import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kika/components/bookcard.dart';

import 'package:kika/components/color.dart';
import 'package:kika/screens/book_details.dart';
import 'package:kika/screens/favorites.dart';
import 'package:kika/screens/search.dart';

class Home extends StatelessWidget {
  static const route = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kika',
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 18.sp,
            height: 27 / 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SearchScreen.route);
            },
            child: Image.asset(
              "assets/images/search.png",
              width: 16.w,
              height: 16.h,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Image.asset(
            "assets/images/filter.png",
            width: 16.w,
            height: 16.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Favorites.route);
            },
            child: Image.asset(
              "assets/images/favorite.png",
              width: 16.w,
              height: 16.h,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SeeAll(
              title: "Books for you",
              seeall: "See All",
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(BookDetails.route);
                    },
                    child: BookCard(
                        imgPath: "assets/images/testimage.png",
                        title: "Half of yellow sun",
                        Author: " Chimanmada Adichie"),
                  ),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie"),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie")
                ],
              ),
            ),
            SeeAll(
              title: "Trending Book",
              seeall: "See All",
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie"),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie"),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie")
                ],
              ),
            ),
            SeeAll(
              title: "BestSellers ",
              seeall: "See All",
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie"),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie"),
                  BookCard(
                      imgPath: "assets/images/testimage.png",
                      title: "Half of yellow sun",
                      Author: " Chimanmada Adichie")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeAll extends StatelessWidget {
  const SeeAll({
    Key? key,
    this.title,
    this.seeall,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final String? seeall;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 14.sp,
            height: 21 / 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            seeall!,
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              height: 21 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
