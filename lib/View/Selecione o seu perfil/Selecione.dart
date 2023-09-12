import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Services/ApiServices/updateAccountType.dart';
import '../Location/location.dart';

class Selecione extends StatefulWidget {
  String? id;
  Selecione({super.key,this.id});
  @override
  State<Selecione> createState() => _SelecioneState();
}

class _SelecioneState extends State<Selecione> {
  String Level = 'Consumer';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CupertinoActivityIndicator(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120),
              Text(
                "Selecione o seu perfil",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff343A40),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                "Selecione um dos perfis abaixo de acordo\n                com a sua usabilidade.",
                style: TextStyle(fontSize: 14, color: Color(0xffa5a5a5)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: Colors.black,
                      value: 'Consumer',
                      groupValue: Level,
                      onChanged: (value) {
                        setState(() {
                          Level = value!;
                        });
                      }),
                  Text(
                    "Sou um consumidor",
                    style: TextStyle(fontSize: 14, color: Color(0xff343434)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: Colors.black,
                      value: 'Company',
                      groupValue: Level,
                      onChanged: (value) {
                        setState(() {
                          Level = value!;
                        });
                      }),
                  Text(
                    "Sou uma empresa   ",
                    style: TextStyle(fontSize: 14, color: Color(0xff343434)),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: SizedBox(
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
                          'accountType': Level.toString(),
                        };
                        ApiServicesforUpdateAccountType.updateAcoountType(body).then((response) {
                          if(response.message=="Account type updated successfully"){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return location(id: widget.id.toString(),);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
