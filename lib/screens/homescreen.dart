import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kika/components/bookcard.dart';
import 'package:kika/components/color.dart';
import 'package:kika/model/book_model.dart';
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
              //Consider using pushNamed and then pop on the next screen to
              //come back to this one. PushReplacement is usually for screens
              //you want to remove from the stack after you're done with it.
              //If user press back on the search screen, it will skip this one
              //and go to the get started screen.
              Navigator.of(context).pushNamed(SearchScreen.route);
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
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed(Favorites.route);
          //   },
          //   child: Image.asset(
          //     "assets/images/favorite.png",
          //     width: 16.w,
          //     height: 16.h,
          //   ),
          // ),
          // SizedBox(
          //   width: 12.w,
          // ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
            child: Column(
          children: [
            NewWidget(
              genre: "Fiction",
            ),
            SizedBox(
              height: 8,
            ),
            NewWidget(
              genre: "Science",
            ),
            SizedBox(
              height: 8,
            ),
            NewWidget(
              genre: "Action",
            ),
            SizedBox(
              height: 8,
            ),
            NewWidget(
              genre: "Biography",
            ),
            SizedBox(
              height: 8,
            ),
            NewWidget(
              genre: "business",
            ),
            SizedBox(
              height: 8,
            ),
            NewWidget(
              genre: "Crime",
            ),
            SizedBox(
              height: 8,
            ),
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<BookModel>? books;
                    if (booksProvider.allBooks.containsKey(genre)) {
                      books = booksProvider.allBooks[genre];
                    } else {
                      books = [];
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: books!.length,
                        itemBuilder: (context, index) {
                          String imgPath = books![index]
                                  .imageLinks
                                  ?.thumbnail ??
                              'https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg';
                          String author = books[index].authors != null &&
                                  books[index].authors!.isNotEmpty
                              ? books[index].authors![0]
                              : 'Author';
                          String title = books[index].title ?? 'Title';
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return BookDetails(
                                    book: books![index],
                                  );
                                }),
                              );
                            },
                            child: BookCard(
                                imgPath: imgPath, title: title, Author: author),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: HexColor("#EA9E2C"),
                        strokeWidth: 2,
                      ),
                    );
                  }
                })),
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
