import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({super.key});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  List<String> Imge = [
    "assets/Group 1000004549.svg",
    "assets/facebook.svg",
    "assets/Instagram.svg",
    "assets/Whatsup.svg",
  ];

  List<Color> color = [
    Color(0xffcd9403),
    Color(0xff0066da),
    Color(0xffd5299b),
    Color(0xff4cd964)
  ];
  List<String> Img = [
    "assets/president eua.webp",
    "assets/army.webp",
    "assets/trump.webp",
    "assets/capital of america.webp",
    "assets/historical place.webp",
  ];
  List<String> Txt = [
    "Ex-vice-presidente dos\nEUA, Mike Pence planeja\nlançar campanha às..",
    "Ele ficou sem países para\nvisitar, então criou o seu:\nConheça o DJ WIlliams..",
    "Trump foi gravado\nfalando sobre\ndocumento confidenc..",
    "Número de empresas de\ncapital aberto caiu à\nmetade nos EUA..",
    "Decisão da Suprema\nCorte dos EUA\nimpulsiona mapa eleit..",
  ];
  List<String> txt1 = [
    "Outubro 2023",
    "Outubro 2023",
    "Outubro 2023",
    "Outubro 2023",
    "Outubro 2023",
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/president eua.webp"),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(100)),
                      height: 45,
                      width: 45,
                      child: SvgPicture.asset(
                        "assets/Arrow - Left.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 130),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Ex-vice-presidente dos EUA, Mike Pence\nplaneja lançar campanha às eleições de\n2024 na semana que vem",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/Type=Default, Component=Avatar.svg"),
                        Text(
                          "Braelo News",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8d6703)),
                        )
                      ],
                    ),
                    Text(
                      "Agosto 2023",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Plus Jakarta Sans",
                          fontWeight: FontWeight.w500,
                          color: Color(0xffd3d3d3)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              SizedBox(
                                height: 25,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xfffbc332),
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        )),
                                    child: Text(
                                      "Entretenimento",
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff856309),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "PlusJakarta Sans"),
                                    )),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  txt("R", 42, FontWeight.w600),
                                  SizedBox(width: 10),
                                  txt("epublicano se distanciou de Donald\nTrump após não apoiar seu esforço para\nanular os resultados da eleição de 2020",
                                      14, FontWeight.w600),
                                ],
                              ),
                              SizedBox(height: 20),
                              txt("O republicano Mike Pence, ex-vice-presidente dos\nEstados Unidos, deve entrar na corrida presidencial de\n2024 contra Donald Trump em 7 de junho, disseram à\nagência “Reuters” duas fontes familiarizadas com a\nsituação.\n\nPence provocou a ira de Trump ao se recusar a apoiar\nseu esforço para anular os resultados da eleição de\n2020.\n\nA expectativa é de que o lançamento da campanha de\nPence ocorra por meio de um vídeo e um discurso no\nEstado de Iowa, disseram as fontes.\n\nConservador ferrenho que apoiou Trump durante todo\no seu mandato, Pence se distanciou cada vez mais do\nex-presidente republicano desde a derrota nas\neleições, dizendo que o encorajamento de Trump aos\nmanifestantes que atacaram o Congresso dos Estados\nUnidos em 6 de janeiro de 2021 o colocou em perigo.\n\nTrump tem uma enorme vantagem nas pesquisas em\num campo republicano que agora tem mais de seis\ncandidatos declarados, dinâmica que pode\nfragmentar a oposição primária contra o ex-\npresidente.\n\nEm 1º de junho, a média de pesquisa de Pence no\ncampo republicano foi inferior a 4%, em comparação\ncom os 53% de Trump, de\nacordo com a média de pesquisas RealClearPolitics.\n\nPence continuou a abraçar muitas das políticas de\nTrump, ao mesmo tempo em que se apresenta como\numa alternativa equilibrada e aberta ao consenso. Ele\ntambém apelou mais diretamente à comunidade cristã\nevangélica, tendo dedicado tempo significativo nos\núltimos meses visitando mega-igrejas em todo o país.",
                                  13, FontWeight.w400),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topLeft,
                                child: txt(
                                    "FONTE: CNN Brasil", 13, FontWeight.w700),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: txt("Imagem: REUTERS | Kevin Lamarque",
                                    13, FontWeight.w700),
                              ),
                              SizedBox(height: 60),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: Imge.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Button(Imge[index], color[index]),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: txt(
                                  "Notícias relacionadas", 16, FontWeight.w600)),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          thickness: 0.5,
                          color: Color(0xffececec),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: Txt.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: BraeloNews(
                                      Img[index], Txt[index], txt1[index]));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget txt(
    String text,
    double Size,
    FontWeight FontWeight,
  ) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Size,
          color: Color(0xff495057),
          fontWeight: FontWeight,
          fontFamily: "PlusJakarta Sans"),
    );
  }

  Widget Button(
    String img,
    Color text,
  ) {
    return SizedBox(
      height: 55,
      width: 55,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: text,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360))),
          child: SvgPicture.asset(img)),
    );
  }
  Widget BraeloNews(
      String img,
      String Text1,
      String Text2,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height / 6.3,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Text1,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xff495057)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset("assets/icon.png"),
                  SizedBox(width: 3),
                  Text(
                    "Braelo News",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Plus Jakarta Sans",
                        fontWeight: FontWeight.w500,
                        color: Color(0xffdfbb60)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                Text2,
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff8a8a8a),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Plus Jakarta Sans"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
