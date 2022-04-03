import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kika/components/bookcard.dart';

import 'package:kika/components/color.dart';
import 'package:kika/provider/books.dart';
import 'package:kika/screens/book_details.dart';
import 'package:kika/screens/favorites.dart';
import 'package:kika/screens/search.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
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
        child: SingleChildScrollView(
            child: Column(
          children: [
            NewWidget(
              genre: "Fantasy",
            ),
            // SizedBox(
            //   height: 8,
            // ),
            // NewWidget(
            //   genre: "Science",
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // NewWidget(
            //   genre: "Action",
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // NewWidget(
            //   genre: "Biography",
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // NewWidget(
            //   genre: "business",
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // NewWidget(
            //   genre: "Crime",
            // ),
            // SizedBox(
            //   height: 8,
            // ),
          ],
        )),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    var booksProvider = Provider.of<BooksProvider>(context, listen: false);
    return Column(
      children: [
        SeeAll(
          title: "$genre",
          seeall: "See All",
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            height: 200.h,
            child: FutureBuilder(
                future: booksProvider.bookCategoryList("$genre"),
                builder: (context, snapshot) {
                  final books = booksProvider.books!;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: booksProvider.books!.length,
                      itemBuilder: (context, index) {
                        String imgPath = books[index].imageLinks?.thumbnail ??
                            'https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg';
                        String author = books[index].authors != null &&
                                books[index].authors!.isNotEmpty
                            ? books[index].authors![0]
                            : 'Author';
                        String title = books[index].title ?? 'Title';
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BookDetails(
                                book: books[index],
                              );
                            }));
                          },
                          child: BookCard(
                              imgPath: imgPath, title: title, Author: author),
                        );
                      });
                })),
      ],
    );
  }
}

class NewWidget2 extends StatelessWidget {
  NewWidget2({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final String genre;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeAll(
          title: "$genre",
          seeall: "See All",
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 220.h,
          child: Consumer<BooksProvider>(builder: (context, books, child) {
            books.bookCategoryList("Science");
            return books.books == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.books!.length,
                    itemBuilder: (context, index) {
                      String imgPath =
                          books.books![index].imageLinks?.thumbnail ??
                              'ImagePath';
                      String author = books.books![index].authors != null &&
                              books.books![index].authors!.isNotEmpty
                          ? books.books![index].authors![0]
                          : 'Author';
                      String title = books.books![index].title ?? 'Title';
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookDetails(
                              book: books.books![index],
                            );
                          }));
                        },
                        child: BookCard(
                            imgPath: imgPath, title: title, Author: author),
                      );
                    });
          }),
        ),
      ],
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
            fontSize: 18.sp,
            height: 21 / 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        // GestureDetector(
        //   onTap: onPressed,
        //   child: Text(
        //     seeall!,
        //     style: GoogleFonts.poppins(
        //       color: Colors.black.withOpacity(0.5),
        //       fontSize: 14.sp,
        //       height: 21 / 14,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
