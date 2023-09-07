import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Estate extends StatelessWidget {
  final String state;

  Estate({required this.state});

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.45;

    return Container(
      height: 210,
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(state),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 60,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xffFBBC1B),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Real Estate",
                                  style: TextStyle(color: Colors.black, fontSize: 6),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border, color: Colors.white),
                              iconSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset("assets/Indicator.svg"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Compact Apartment",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Commercial Studio",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SvgPicture.asset("assets/location2.svg", color: Colors.grey.withOpacity(0.4)),
                    SizedBox(width: 3),
                    Text(
                      "Maimi",
                      style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "\$ 950,00",
                          style: TextStyle(color: Color(0XFFD78E00), fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

