import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
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
                  "Criss Germano",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Plus Jakarta Sans",
                      color: Color(0xff111111)),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/jurandir.jpg")),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            height: 40,
                            width: 40,
                            child: Stack(
                              children: [
                                Transform.translate(
                                  offset: Offset(25, 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00c566),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    height: 12,
                                    width: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff6f6f6),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(32),
                                      topRight: Radius.circular(32),
                                      topLeft: Radius.circular(32)),
                                ),
                                height: 80,
                                width: MediaQuery.of(context).size.width / 1.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Lorem ipsum dolor sit et,\nconsectetur adipiscing.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff8c939a),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Plus Jakarta Sans"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "15:42 PM",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Plis Jakarta Sans",
                                    color: Color(0xff9ca4ab)),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff75818d),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32)),
                                    ),
                                    height: 55,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Lorem ipsum dolor sit et",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: "Plis Jakarta Sans",
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "15:42 PM",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Plis Jakarta Sans",
                                        color: Color(0xff9ca4ab)),
                                  )
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/profile3.jpg")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff6f8fe),
                  border: Border.all(color: Color(0xffe3e7ec)),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 60,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/Attach.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/Vector 3.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          hintText: "Message",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xffc0c5cd),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Plus Jakarta Sans",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff75818d),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        "assets/Send.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
