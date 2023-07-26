import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rating_summary/rating_summary.dart';


class buildBottomSheetContent extends StatelessWidget {
  const buildBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(
        children: [
          SizedBox(height: 10),
          Center(child: SvgPicture.asset("assets/Bar1.svg")),
          SizedBox(height: 15),
          Center(
            child: Text(
              "Rate",
              style: TextStyle(
                  fontSize: 21,
                  fontFamily: "Plus Jakarta Sans",
                  fontWeight: FontWeight.w700,
                  color: Color(0xff212121)),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.5,
            color: Color(0xffefefef),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: RatingSummary(
              counter: 15,
              average: 4.777,
              counterFiveStars: 7,
              counterFourStars: 5,
              counterThreeStars: 3,
              counterTwoStars: 2,
              counterOneStars: 1,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xffcd9403), width: 1)),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  maxLines: 5,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText:
                      "Wonderful work! I highly recommend, it is\nattentive, capricious, and on top of that, the\npampering that only we like to receive!\nSuper recommend! ❤️❤️❤️",
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffa6aeb7),
                      ),
                      suffixIcon: SvgPicture.asset(
                        "assets/EMoji.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.5,
            color: Color(0xffefefef),
          ),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: Color(0xffcd9403),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xfffdf7e8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Plus Jakarta Sans",
                            color: Color(0xffcd9403)),
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: SvgPicture.asset("assets/Vector.svg"),
                            content: Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: Text(
                                "Yeah!",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color(0xff343A40),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Plus Jakarta Sans"),
                              ),
                            ),
                            actions: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Your evaluation was sent with\nsuccessfully! Your feedback is\n     always important to us!",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff6C6C6C)),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffcd9403),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 0),
                      child: Text(
                        "Send",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Plus Jakarta Sans",
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
