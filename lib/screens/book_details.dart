import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:kika/components/appbutton.dart';
import 'package:kika/components/color.dart';
import 'package:kika/model/book_model.dart';
import 'package:kika/screens/homescreen.dart';

// class BookPreview extends StatelessWidget {
//   static const route = '/BookPreview';
//   const BookPreview({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 300.h,
//               color: HexColor("#79a377"),
//               padding: EdgeInsets.only(top: 10),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         SizedBox(
//                           width: 12.w,
//                         ),
//                         Image.asset(
//                           "assets/images/search.png",
//                           width: 20.w,
//                           height: 20.h,
//                         ),
//                         SizedBox(
//                           width: 12.w,
//                         ),
//                         Image.asset(
//                           "assets/images/unfavorite.png",
//                           width: 20.w,
//                           height: 20.h,
//                         ),
//                         SizedBox(
//                           width: 12.w,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Image.asset(
//                       "assets/images/testimage.png",
//                       width: 170.w,
//                       height: 270.h,
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       height: 71.h,
//                       width: double.infinity,
//                       color: Colors.black38,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 8),
//                         child: Row(
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 text: 'The Psychology of Money \n',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16.sp,
//                                   height: 24 / 16,
//                                   color: Colors.white,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Morgan Housel',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14.sp,
//                                       color: primaryColor,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: AppButton(
//                                 buttonText: "About book",
//                                 textSize: 14.sp,
//                                 buttonWidth: 117.w,
//                                 textColor: Colors.white,
//                                 backgroundColor: primaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BookDetails extends StatelessWidget {
  static const route = '/BookDetails';
  BookDetails({Key? key, this.book}) : super(key: key);

  BookModel? book;

  @override
  Widget build(BuildContext context) {
    String description = book!.title ?? " No About";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.h,
                color: HexColor("#79a377"),
                padding: EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Image.asset(
                                "assets/images/back.png",
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          "assets/images/unfavorite.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        book!.imageLinks?.smallThumbnail ??
                            "http://books.google.com/books/content?id=kQUVAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
                        width: 170.w,
                        height: 270.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 71.h,
                        width: double.infinity,
                        color: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200.w,
                                    child: Text(
                                      book!.title ?? " No Title",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        height: 24 / 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      book!.authors!.isNotEmpty
                                          ? book!.authors![0]
                                          : 'Author',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppButton(
                                  buttonText: "Read",
                                  textSize: 14.sp,
                                  buttonWidth: 117.w,
                                  textColor: Colors.white,
                                  backgroundColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextandNum(
                      num: book!.publishedDate ?? 23,
                      text: "Published Date",
                    ),
                    TextandNum(
                      num: book!.averageRating ?? "--",
                      text: "Rating",
                    ),
                    TextandNum(
                      num: book!.pageCount ?? 23,
                      text: "Page Count",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Synopsis",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                    height: 24 / 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  ''' $description ''',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextandNum extends StatelessWidget {
  TextandNum({
    Key? key,
    this.num,
    this.text,
  }) : super(key: key);
  var num;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "$num",
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
