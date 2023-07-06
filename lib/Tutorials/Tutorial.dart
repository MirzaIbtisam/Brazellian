import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
                    "Tutoriais",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Plus Jakarta Sans",
                        color: Color(0xff111111)),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff6f8fe),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        "assets/Seacrh.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      hintText: "Search...",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9ca4ab),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Plus Jakarta Sans"),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15)),
                ),
              ),
              SizedBox(height: 30),
              txt("Como cadastrar um novo listing na\nplataforma Braelo?"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
              SvgPicture.asset("assets/vedio pic.svg"),
              SizedBox(height: 20),
              txt("Como criar uma conta business para\no meu negócio?"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
              txt("Como alterar meu plano free para\num plano Business?"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
              txt("Saiba como efetuar chamadas\ndiretamente da plataforma"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
              txt("Como editar meu listing dentro\ndo meu painel?"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
              txt("Como copiar o meu QRpin para\ncompartilhar com um amigo?"),
              SizedBox(height: 20),
              divider(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget txt(
    String text,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Plus Jakarta Sans",
            color: Color(0xff111111)),
      ),
    );
  }

  Widget divider() {
    return Divider(
      thickness: 0.5,
      color: Color(0xffe3e7ec),
    );
  }
}
