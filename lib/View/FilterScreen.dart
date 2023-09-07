import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  final BuildContext context;

  Filter(this.context, {Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class Item {
  final String title;
  final List<Item>? children;

  Item({required this.title, this.children});

  static List<Item> getVehicles() {
    return [
      Item(title: "Chefe de cozinha"),
      Item(title: "Comida para festas"),
      Item(title: "Construção"),
      Item(title: "Contabilidade"),
      Item(title: "Decoração"),
      Item(title: "Design"),
      Item(title: "Filmagem"),
      Item(title: "Fotografia"),
      Item(title: "Home Care"),
      Item(title: "Imigração"),
      Item(title: "Jurídico"),
      Item(title: "Landinscaping"),
    ];
  }

  static List<Item> getServices() {
    return [
      Item(title: "Apartamento"),
      Item(title: "Casa"),
      Item(title: "Studio"),
      Item(title: "Quarto"),
      Item(title: "Apartamento"),
      Item(title: "Casa"),
      Item(title: "Studio"),
      Item(title: "Quarto"),
      Item(title: "Apartamento"),
      Item(title: "Casa"),
      Item(title: "Studio"),
      Item(title: "Quarto"),
    ];
  }

  static List<Item> createItemList() {
    List<Item> Servicos = getVehicles();
    List<Item> Imoveis = getServices();
    List<Item> Lojas = getVehicles();
    List<Item> Locais = getServices();
    List<Item> Trabalho = getVehicles();
    List<Item> Veiculos = getServices();
    List<Item> NovoItem = getVehicles();

    return [
      Item(title: "Serviços", children: Servicos),
      Item(title: "Imóveis", children: Imoveis),
      Item(title: "Lojas", children: Lojas),
      Item(title: "Locais", children: Locais),
      Item(title: "Trabalho", children: Trabalho),
      Item(title: "Veículos", children: Veiculos),
      Item(title: "Novo Item", children: NovoItem),
    ];
  }
}

class _FilterState extends State<Filter> {
  List<Item> _filteredItems = Item.createItemList();
  List<Item> _filteredItems1 = [];
  int selected = -1; // Initializing to -1 means no button is selected initially
  int count = -1; // Initializing to -1 means no item is selected initially

  void _handleItemTap(Item item) {
    setState(() {
      selected = _filteredItems.indexOf(item);
      if (item.children != null) {
        _filteredItems1 = item.children!;
        count = 0;
      } else {
        count = -1; // Reset count if no children
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredItems1 = _filteredItems[0].children ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.8,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const Text(
                  "Filtrar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/Close_Icon.svg"),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xffefefef),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return ListTile(
                        title: Text(
                          item.title,
                          style: TextStyle(
                            color: index == selected
                                ? Colors.black
                                : Color(0xff75838d),
                            fontWeight: index == selected
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                        onTap: () => _handleItemTap(item),
                        selected: index == selected,
                        selectedTileColor: Colors.transparent,
                        tileColor: index == selected
                            ? Color(0xffFBBC1B).withOpacity(0.1)
                            : null,
                      );
                    },
                  ),
                ),
                VerticalDivider(
                  thickness: 0.5,
                  color: Color(0xffefefef),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: _filteredItems1.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems1[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: Text(
                                    item.title,
                                    style: TextStyle(
                                      color: count == index
                                          ? Colors.black
                                          : Color(0xff75838d),
                                      fontWeight: count == index
                                          ? FontWeight.w500
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      count = index;
                                    });
                                  },
                                ),
                              ),
                              count == index
                                  ? Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.check,
                                        color: Color(0xffFBBC1B),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          Divider(
                            thickness: 0.9,
                            color: Color(0xffefefef),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.1,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffcd9403),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  "Apply filter",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Plus Jakarta Sans",
                      color: Colors.white),
                )),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
