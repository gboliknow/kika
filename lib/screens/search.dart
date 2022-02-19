import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kika/screens/homescreen.dart';

class SearchScreen extends StatelessWidget {
  static const route = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            new Card(
                elevation: 4.0,
                child: new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintText: "What books are your looking to find?",
                        prefixIcon: new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        border: InputBorder.none),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
