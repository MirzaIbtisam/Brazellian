import 'package:brazeellian_community/Welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Interests extends StatefulWidget {
  Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List interest = [
    {'title': 'House cleaning', 'isActive': false},
    {'title': 'Handyman', 'isActive': false},
    {'title': 'Mechanic', 'isActive': false},
    {'title': 'Sales', 'isActive': false},
    {'title': 'Designer', 'isActive': false},
    {'title': 'Marketing','isActive': false},
    {'title': 'Legal Consulting', 'isActive': false},
    {'title': 'Beauty', 'isActive': false},
    {'title': 'Events', 'isActive': false},
    {'title': 'Barbershop', 'isActive': false},
    {'title': 'Coffeshop', 'isActive': false},
    {'title': 'Restaurants and food', 'isActive': false},
    {'title': 'Business', 'isActive': false},
    {'title': 'Real State', 'isActive': false},
    {'title': 'Rent', 'isActive': false},
    {'title': 'Finance', 'isActive': false},
    {'title': 'Vehicles', 'isActive': false},
    {'title': 'Fashion', 'isActive': false},
    {'title': 'Jobs', 'isActive': false},
    {'title': 'Places near me', 'isActive': false},
    {'title': 'Other', 'isActive': false},
  ];
  changeState(item) {
    setState(() {
      item['isActive'] = !item['isActive'];
    });
  }
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CupertinoActivityIndicator(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 50),
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
                        "assets/Combined-Shape.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Text(
                    "Select your interests",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Select your topic\n      of interest",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff212121),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Qual idioma você prefere\n      ver no aplicativo?",
                style: TextStyle(fontSize: 15, color: Color(0xff6C6C6C)),
              ),
              SizedBox(height: 40),
              Wrap(
                direction: Axis.horizontal,
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: interest
                      .map((option) => new Container(
                      child: InkWell(
                          onTap: () {
                            changeState(option);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: option['isActive']
                                    ? Color(0xffCD9403)
                                    : Colors.white,
                                border: Border.all(color: Color(0xffCD9403), width: 1.3),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              height: 40,
                              padding: EdgeInsets.all(10),
                              child: Text('${option['title']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: option['isActive']
                                          ? Colors.white
                                          : Color(0xffCD9403)))))))
                      .toList()),
              SizedBox(height: 10,),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.150,
                child: ElevatedButton(
                    onPressed: () async{
                      setState(() {
                        loading=true;
                      });
                      await Future.delayed(Duration(seconds: 3));
                      setState(() {
                        loading=false;
                      });
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return welcome();
                          }));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffCD9403),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "Avançar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );

  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: isActive ? Color(0xff1763DD) : Colors.white,
    );
  }
}
