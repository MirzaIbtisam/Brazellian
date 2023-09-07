import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../ViewModel/ApiServices/updateLocation.dart';
import '../Language/language.dart';
import '../Select your interests/Interests.dart';

class location extends StatefulWidget {
  String id;
  location({super.key,required this.id});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  List interest = [
    {'title': 'Miami'   },
    {'title': 'Jacksonville'   },
    {'title': 'Orlando'   },
    {'title': 'St. Petersburg'   },
    {'title': 'Miami Gardens'   },
    {'title': 'Lake Worth Beach'   },
    {'title': 'North Miami Beach'   },
    {'title': 'Clermont'   },
    {'title': 'Boca Raton'   },
    {'title': 'Melbourne'   },
    // {'title': 'Garden & Outdoor'   },
    // {'title': 'Office Products'   },
    // {'title': 'Perfumes'   },
    // {'title': 'Toys & Games'   },
    // {'title': 'Computers & Apps'   },
  ];
  int indexx=0;
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CupertinoActivityIndicator(),
        child: Column(
          children: [
            SizedBox(height: 50),
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
                        "assets/Combined-Shape.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  SizedBox(),

                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffefefef)),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15, top: 15),
                      border: InputBorder.none,
                      prefixIcon: SvgPicture.asset(
                        "assets/Seacrh.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "Procurar",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xff9CA4AB),
                      )),),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: interest.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory
                      ),
                      onPressed: (){
                        indexx=index;
                        setState(() {
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                interest[index]['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: indexx==index?Colors.black:Color(0xff999999),
                                  fontWeight: indexx==index?FontWeight.bold:FontWeight.normal,
                                ),
                              ),
                              indexx==index?SvgPicture.asset("assets/check.svg"):Container(),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(thickness: 0.2,color: Colors.grey.withOpacity(0.6),)

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.150,
              child: ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      loading=true;
                    });
                    await Future.delayed(Duration(seconds: 3));
                    Map<String, dynamic> body = {
                      'id': widget.id.toString(),
                      'location': indexx.toString(),
                    };
                    ApiServicesforUpdateLocation.updateLocation(body).then((response) {
                      if(response.message=="Location updated successfully"){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return language(id:widget.id);
                            }));

                      }
                      else{
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Error Message'),
                                content:response.error!=null? Text(response.error.toString()):Text(response.message.toString()),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); //close Dialog
                                    },
                                    child: Text('Close'),
                                  )
                                ],
                              );
                            });
                      }
                    });
                    setState(() {
                      loading=false;
                    });

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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
