import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kika/components/bookcard.dart';
import 'package:provider/provider.dart';

import 'package:kika/components/color.dart';
import 'package:kika/provider/books.dart';
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
          child: SizedBox(
            width: 30.w,
            height: 30.h,
            child: Image.asset(
              "assets/images/back.png",
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
      ),
      body: ChangeNotifierProvider<BooksProvider>(
        create: (context) => BooksProvider(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Consumer<BooksProvider>(builder: (context, books, child) {
            books.bookList();
            return books.books == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
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
                      String description =
                          books.books![index].description ?? 'No description';
                      return BookInfo(
                        imgPath: imgPath,
                        title: title,
                        Author: author,
                        Description: description,
                      );
                    });
          }),
        ),
      ),
    );
  }
}
