import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kika/components/bookcard.dart';
import 'package:kika/provider/books.dart';
import 'package:kika/screens/book_details.dart';
import 'package:kika/screens/homescreen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const route = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();
    var booksProvider = Provider.of<BooksProvider>(context, listen: false);
    String? genre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Card(
                    elevation: 4.0,
                    child: new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        controller: searchController,
                        decoration: new InputDecoration(
                            hintText: "What books are your looking to find?",
                            suffixIcon: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Image.asset(
                                  "assets/images/search.png",
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                            ),
                            border: InputBorder.none),
                        onTap: () {
                          booksProvider.bookCategoryList(searchController.text);
                        },
                      ),
                    )),
              ),
              Container(
                height: 700.h,
                child: FutureBuilder(
                    future:
                        booksProvider.bookCategoryList(searchController.text),
                    builder: (context, snapshot) {
                      final books = booksProvider.books!;
                      return booksProvider.books == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: booksProvider.books!.length,
                              itemBuilder: (context, index) {
                                String imgPath = books[index]
                                        .imageLinks
                                        ?.thumbnail ??
                                    'https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg';
                                String author = books[index].authors != null &&
                                        books[index].authors!.isNotEmpty
                                    ? books[index].authors![0]
                                    : 'Author';
                                String title = books[index].title ?? 'Title';
                                String description = books[index].description ??
                                    'No description';
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return BookDetails(
                                        book: books[index],
                                      );
                                    }));
                                  },
                                  child: BookInfo(
                                    imgPath: imgPath,
                                    title: title,
                                    Author: author,
                                    Description: description,
                                  ),
                                );
                              });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
