import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> search = [
    "House Cleaner",
    "Paintor de muros",
    "Encanador",
    "Mecânico",
    "Cuidadora",
    "Técnico de informática",
    "Passadeira",
    "Pedreiro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset(
                      "assets/back arrow.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xff2196f3), width: 1)),
            height: 50,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    border: InputBorder.none,
                    prefixIcon: SvgPicture.asset(
                      "assets/Seacrh.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: "O que você está buscando?",
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffa6aeb7)),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/Vector (1).svg"),
                        SizedBox(width: 15),
                        SvgPicture.asset("assets/Vector 2.svg"),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/shape.svg")),
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            thickness: 0.5,
            color: Color(0xffefefef),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff75818d)),
                ),
                Text(
                  "Clear All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff9ca4ab)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.5,
              color: Color(0xffefefef),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: search.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: list(search[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget list(
    String search,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          search,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Plus Jakarta Sans",
              color: Color(0xff757575)),
        ),
        SvgPicture.asset("assets/close.svg")
      ],
    );
  }
}
