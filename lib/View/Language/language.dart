import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../ViewModel/ApiServices/updateLanguage.dart';
import '../Select your interests/Interests.dart';

class language extends StatefulWidget {
  String? id;
  language({super.key,this.id});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  final List<String> items = ['English', 'Urdu', 'Arabic', 'French','Português do Brasil'];
  final TextEditingController controller = TextEditingController(text: '');
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
                    "Language",
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
            SizedBox(height: 30),
            Text(
              "Selecione o idioma",
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff343A40),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Qual idioma você prefere\n       ver no aplicativo?",
              style: TextStyle(fontSize: 14, color: Color(0xff6C6C6C)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Idioma",
                  style: TextStyle(fontSize: 15, color: Color(0xff78828A)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomDropdown(
                fillColor: Color(0xfff6f8fe),
                selectedStyle: TextStyle(fontSize: 16,color: Color(0xffb0b7be)),
                items: items,
                controller: controller,
                onChanged: (value) {
                  // Update the controller value when the selection changes
                  controller.text = value!;
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
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
                      Map<String, dynamic> body = {
                        'id': widget.id.toString(),
                        'language': controller.text.toString(),
                      };
                      ApiServicesforUpdateLanguage.updateLanguage(body).then((response) {
                        if(response.message=="Language updated successfully"){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return Interests(id: widget.id,);
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
            ),
          ],
        ),
      ),
    );
  }
}
