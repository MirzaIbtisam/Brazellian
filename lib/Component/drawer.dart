import 'package:brazeellian_community/Edit_Profile/Edit_Profile.dart';
import 'package:brazeellian_community/Itens%20Salvos/Itnes_Salvos.dart';
import 'package:brazeellian_community/Messages/Messages.dart';
import 'package:brazeellian_community/Not%C3%ADcias/Not%C3%ADcias.dart';
import 'package:brazeellian_community/Tutorials/Tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CupertinoActivityIndicator(),
      inAsyncCall: loading,
      child: Drawer(
        backgroundColor: Color(0xffedaa00),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffffd600), width: 2.5),
                        image: const DecorationImage(
                            image: AssetImage("assets/profile.jpg"),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Criss Germano",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Plus jakarta Sans"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "crissgermano@gmail.com",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Comunicação",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans"),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await Future.delayed(Duration(seconds: 0));
                            setState(() {
                              loading = false;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Notcias();
                            }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/news paper.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Notícias",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  )
                                ],
                              ),
                              SvgPicture.asset("assets/Icon - Next.svg")
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(
                                    const Duration(seconds: 0));
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Tutorial();
                                }));
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/tutorials.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Tutoriais",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  )
                                ],
                              ),
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans"),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(
                                    const Duration(seconds: 0));
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Edit_Profile();
                                }));
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/User, Profile.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Editar perfil",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  )
                                ],
                              ),
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/Key.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Alterar senha",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Personal Info",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans"),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(Duration(seconds: 0));
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Messages();
                                    }));
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/message.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Mensagens",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  )
                                ],
                              ),
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/phone.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Ligações",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  loading = true;
                                });
                                await Future.delayed(
                                    const Duration(seconds: 0));
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Itens_Salvos();
                                }));
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/itens.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    "Itens salvos",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Plus Jakarta Sans"),
                                  )
                                ],
                              ),
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/browser-web-windows.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Gerenciar plano",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/pin.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Meu pin",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Reports",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans"),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/estatics.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Estatísticas",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/Meus.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Meus anúncios",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/Destaques.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Destaque",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 40),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Help and Support",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff111111),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Plus Jakarta Sans"),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/Politcs.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Políticas de privacidade",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/tasklist-document-group_1.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Perguntas frequences",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/suporte.svg"),
                                SizedBox(width: 10),
                                Text(
                                  "Suporte",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff111111),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Plus Jakarta Sans"),
                                )
                              ],
                            ),
                            SvgPicture.asset("assets/Icon - Next.svg")
                          ],
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xfffbbeb9), width: 1))),
                              child: Text(
                                "Deletar conta",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xfffbbeb9),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PlusJakarta Sans"),
                              )),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: Color(0xffa1a8ae), width: 1))),
                              child: Text(
                                "Sair",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffa1a8ae),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PlusJakarta Sans"),
                              )),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
