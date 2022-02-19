import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:kika/components/appbutton.dart';
import 'package:kika/components/color.dart';
import 'package:kika/screens/homescreen.dart';

class BookPreview extends StatelessWidget {
  static const route = '/BookPreview';
  const BookPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300.h,
              color: HexColor("#79a377"),
              padding: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        Image.asset(
                          "assets/images/search.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Image.asset(
                          "assets/images/unfavorite.png",
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/testimage.png",
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
                            RichText(
                              text: TextSpan(
                                text: 'The Psychology of Money \n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  height: 24 / 16,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Morgan Housel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: AppButton(
                                buttonText: "About book",
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
          ],
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  static const route = '/BookDetails';
  const BookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              Navigator.of(context)
                                  .pushReplacementNamed(Home.route);
                            },
                            child: SizedBox(
                              width: 40.w,
                              height: 40.h,
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
                      child: Image.asset(
                        "assets/images/testimage.png",
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
                              RichText(
                                text: TextSpan(
                                  text: 'The Psychology of Money \n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    height: 24 / 16,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Morgan Housel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
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
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextandNum(
                      num: 200,
                      text: "Pages",
                    ),
                    TextandNum(
                      num: 10,
                      text: "Hours",
                    ),
                    TextandNum(
                      num: 4.5,
                      text: "Ratings",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "About Book",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16.sp,
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
                  '''Lörem ipsum onde decivån resm. Jång vogt, som sogon om heterofösamma inte nenera polysåras. Tina prenas, bevosam jåsäde att änågt, såväl som voplarar. Tivoment ineledes dengen. 
Teler jånen dåräsade diaspeheten nen exonera. Jobel krosärtad spefasärar falanat i migen syskapet nessade nyda. Sosenera åkropp år den fämugt pseudogt. Årade prenas mimiska trespevis sadok bör och varysk. 
Suprese trere i seför kvasilig har fölogi, i sakrovis jag vick. Biska lande pur reabårade: nilig. Jösönat reräsesk vigon i ospen gigasa. Epir vajåra och läng. 
Realig nåliga: fasest bevis helun i dist inklusive hejåbel. Soliga såse än trit tektiga nibyplare, inte syr. Säbåpp homoska söns dålig för hening, is. Kigisk åtissade respektive ivis, suprartad, dän diktigt sädängar. 
Mikross depodat, multina åliga samt al. Läkron täse nåde de ången om debylogi i ism för opp. Prerade diagram, negisk. Bioras bessa viren till tisa plada ifall megasärade spena osm. 
Båspesade jåtätt dålig, poner multiponera nisk. Sans sese infrafasat i posök, det vill säga polys, i faskapet. Fås prelulavis spevott. Våning sunifåbåsk, mar pengar: lalasaling terralogi i pär. 
,''',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                    height: 21 / 14,
                    fontWeight: FontWeight.w300,
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
  const TextandNum({
    Key? key,
    this.num,
    this.text,
  }) : super(key: key);
  final double? num;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$num",
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 16.sp,
            height: 24 / 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          text!,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16.sp,
            height: 24 / 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
