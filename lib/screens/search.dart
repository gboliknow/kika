import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kika/components/bookcard.dart';
import 'package:kika/provider/books.dart';
import 'package:kika/provider/search_book.dart';
import 'package:kika/screens/book_details.dart';
import 'package:kika/screens/homescreen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const route = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = new TextEditingController();
  bool isLoading = false;

  startSearch() async {
    if (searchController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<SearchProvider>(context, listen: false)
          .SearchList(searchController.text);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(
      context,
    );

    return ChangeNotifierProvider<SearchProvider>(
      create: (context) => SearchProvider(),
      child: Scaffold(
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
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                      elevation: 4.0,
                      child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          controller: searchController,
                          decoration: new InputDecoration(
                              hintText: "Search for titles,author or topics",
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
                            startSearch();
                          },
                        ),
                      )),
                ),
                isLoading
                    ? Container(
                        height: 500.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: HexColor("#EA9E2C"),
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Container(
                        height: 700.h,
                        child: ListView.builder(
                            itemCount: searchProvider.searchbooks!.length,
                            itemBuilder: (context, index) {
                              String imgPath = searchProvider
                                      .searchbooks![index]
                                      .imageLinks
                                      ?.thumbnail ??
                                  'https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg';
                              String author =
                                  searchProvider.searchbooks![index].authors !=
                                              null &&
                                          searchProvider.searchbooks![index]
                                              .authors!.isNotEmpty
                                      ? searchProvider
                                          .searchbooks![index].authors![0]
                                      : 'Author';
                              String title =
                                  searchProvider.searchbooks![index].title ??
                                      'Title';
                              String description = searchProvider
                                      .searchbooks![index].description ??
                                  'No description';
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BookDetails(
                                      book: searchProvider.searchbooks![index],
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
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
