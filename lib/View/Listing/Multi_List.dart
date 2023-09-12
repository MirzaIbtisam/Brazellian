import 'dart:io';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../Models/signUpModel.dart';
import '../../Services/ApiServices/addListingApi.dart';
import '../Listing_Screen/View.dart';

class Multi_List extends StatefulWidget {
  String type;
  final int page;

  Multi_List({super.key, required this.type, required this.page});

  @override
  State<Multi_List> createState() => _Multi_ListState();
}

class _Multi_ListState extends State<Multi_List>
    with SingleTickerProviderStateMixin {
  // File? _selectedImage;

  Future<void> _showImagePickerDialog(BuildContext context, int index) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        pickedImages[index] = File(pickedImage.path);
      });
    }
  }

  final List<String> items = [
    'Event',
    'Property',
    'Advert',
    'Service',
    'Work',
    'Vehicle',
  ];
  final List<String> items1 = [
    'Feed',
    'Cleaning',
    'Construção',
    'Feed',
    'Cleaning',
    'Construção',
  ];
  final List<String> items2 = [
    'Coffeshop',
    'House Cleaning',
    'Electricista',
    'Barco',
    'Coffeshop',
  ];
  final List<String> items3 = [
    '1 Drom',
    '2 Drom',
    '3 Drom',
    '4 Drom',
    '5 Drom',
  ];
  final List<String> items4 = [
    '1 Bathroom',
    '2 Bathroom',
    '3 Bathroom',
    '4 Bathroom',
    '5 Bathroom',
  ];
  final List<String> items5 = [
    '1 Suite',
    '2 Suite',
    '3 Suite',
    '4 Suite',
    '5 Suite',
  ];
  final List<String> items6 = [
    '1 vagas',
    '2 vagas',
    '3 vagas',
    '4 vagas',
    '5 vagas',
  ];
  List Salvos = [
    {'title': 'Pub', 'isActive': false},
    {'title': 'Restaurant', 'isActive': false},
    {'title': 'Beauty Salon', 'isActive': false},
    {'title': 'Bar', 'isActive': false},
    {'title': 'DJ', 'isActive': false},
    {'title': 'Coffeshop', 'isActive': false},
    {'title': 'Bakery', 'isActive': false},
    {'title': 'Party Room', 'isActive': false},
    {'title': 'Studio', 'isActive': false},
    {'title': 'Language School', 'isActive': false},
    {'title': 'Technical Course', 'isActive': false},
    {'title': 'Barbershop', 'isActive': false},
  ];
  late TextfieldTagsController _controller;

  void changeState(Map<String, dynamic> selectedItem) {
    setState(() {
      for (var item in Salvos) {
        item['isActive'] = (item == selectedItem);
      }
    });
  }

  final TextEditingController controller = TextEditingController(text: '');
  final TextEditingController controller1 = TextEditingController(text: '');
  final TextEditingController controller2 = TextEditingController(text: '');
  final TextEditingController controller3 = TextEditingController(text: '');
  final TextEditingController controller4 = TextEditingController(text: '');
  final TextEditingController controller5 = TextEditingController(text: '');
  final TextEditingController controller6 = TextEditingController(text: '');
  List<TextEditingController> controllers = [
    TextEditingController(text: ''),
    TextEditingController(text: ''),
    TextEditingController(text: ''),
    TextEditingController(text: ''),
    TextEditingController(text: ''),
  ];
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _image = null;
    });
  }

  late TabController _tabController;
  late List<File?> pickedImages = List.generate(6, (index) => null);

  @override
  void initState() {
    File? imageone;
    File? imagetwo;
    File? imagethree;
    File? imagefour;
    File? imagefive;
    File? imagesix;

    pickedImages = [
      imageone,
      imagetwo,
      imagethree,
      imagefour,
      imagefive,
      imagesix,
    ];
    // TODO: implement initState
    super.initState();
    _controller = TextfieldTagsController();
    _tabController = TabController(length: 2, vsync: this);

    controller.text = widget.type.toString();
    if (widget.type == 'Event') {
      final TextEditingController a = TextEditingController(text: '');
      final TextEditingController b = TextEditingController(text: '');
      final TextEditingController c = TextEditingController(text: '');
      final TextEditingController d = TextEditingController(text: '');
      final TextEditingController e = TextEditingController(text: '');
      controllers.addAll([a, b, c, d, e]);
    } else if (widget.type == 'Property') {
      final TextEditingController a = TextEditingController(text: '');
      controllers.add(a);
    } else if (widget.type == 'Advert') {
      final TextEditingController a = TextEditingController(text: '');
      final TextEditingController b = TextEditingController(text: '');
      controllers.addAll([a, b]);
    } else if (widget.type == 'Service' || widget.type == 'Work') {
      final TextEditingController a = TextEditingController(text: '');
      final TextEditingController b = TextEditingController(text: '');
      controllers.addAll([a, b]);
    } else if (widget.type == 'Vehicle') {
      final TextEditingController a = TextEditingController(text: '');
      final TextEditingController b = TextEditingController(text: '');
      controllers.addAll([a, b]);
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  static const List<String> _pickLanguage = <String>[
    'c',
    'c++',
    'java',
    'python',
    'javascript',
    'php',
    'sql',
    'yaml',
    'gradle',
    'xml',
    'html',
    'flutter',
    'css',
    'dockerfile'
  ];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  double _distanceToField = 2.0;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.page,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
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
                      "${widget.type}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Plus Jakarta Sans",
                          color: Color(0xff111111)),
                    ),
                    SizedBox(width: 35),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Tab(
                      icon: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffcd9403),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: "Plus Jakarta Sans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "New listing",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff111111),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        "assets/listing_vector.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Tab(
                      icon: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffacb6be),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: "Plus Jakarta Sans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Confirm listing",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffb2bcc3),
                              fontFamily: "Plus Jakarta Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: 2500,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Divider(
                            color: Color(0xffececec),
                            thickness: 0.5,
                          ),
                          SizedBox(height: 10),
                          Txt("Select the Listing type"),
                          SizedBox(height: 10),
                          Dropdown(items, controller, flag: true),
                          SizedBox(height: 20),
                          Txt("Listing title"),
                          SizedBox(height: 10),
                          Box("The Power of the Network  |", controllers[0]),
                          SizedBox(height: 20),
                          Txt("Description"),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffc9cdd2))),
                            height: 150,
                            width: Get.width * 0.9,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: TextFormField(
                                maxLines: 5,
                                controller: controllers[1],
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Lorem Ipsum is simply dummy text of\nthedd printing and typesetting industry.",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: Color(0xffbbc0c4))),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Txt("Keywords"),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "(Words or categories related to this item)",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: Color(0xffbbc0c4)),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffc9cdd2))),
                            height: 100,
                            width: Get.width * 0.9,
                            child: Column(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 5.0, top: 10),
                                //   child: Align(
                                //     alignment: Alignment.topLeft,
                                //     child: Text(
                                //       "Restaurante |",
                                //       style: TextStyle(
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.w500,
                                //           fontFamily: "Plus Jakarta Sans",
                                //           color: Color(0xffa6adb2)),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 10),
                                Autocomplete<String>(
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 4.0),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Material(
                                          elevation: 4.0,
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                maxHeight: 200),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: options.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final dynamic option =
                                                    options.elementAt(index);
                                                return TextButton(
                                                  onPressed: () {
                                                    onSelected(option);
                                                  },
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 15.0),
                                                      child: Text(
                                                        '#$option',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 74, 137, 92),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  optionsBuilder:
                                      (TextEditingValue textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return _pickLanguage.where((String option) {
                                      return option.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  onSelected: (String selectedTag) {
                                    _controller.addTag = selectedTag;
                                  },
                                  fieldViewBuilder:
                                      (context, ttec, tfn, onFieldSubmitted) {
                                    return TextFieldTags(
                                      textEditingController: ttec,
                                      focusNode: tfn,
                                      textfieldTagsController: _controller,
                                      initialTags: const [],
                                      textSeparators: const [' ', ','],
                                      letterCase: LetterCase.normal,
                                      validator: (String tag) {
                                        if (tag == 'php') {
                                          return 'No, please just no';
                                        } else if (_controller.getTags!
                                            .contains(tag)) {
                                          return 'you already entered that';
                                        }
                                        return null;
                                      },
                                      inputfieldBuilder: (context, tec, fn,
                                          error, onChanged, onSubmitted) {
                                        return ((context, sc, tags,
                                            onTagDelete) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: TextField(
                                              controller: tec,
                                              focusNode: fn,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: _controller.hasTags
                                                    ? ''
                                                    : "Enter Keywords",
                                                errorText: error,
                                                prefixIconConstraints:
                                                    BoxConstraints(
                                                        maxWidth:
                                                            _distanceToField *
                                                                0.74),
                                                prefixIcon: tags.isNotEmpty
                                                    ? SingleChildScrollView(
                                                        controller: sc,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                            children: tags.map(
                                                                (String tag) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xfffbd35c),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            ),
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        10.0),
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10.0,
                                                                    vertical:
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  child: Text(
                                                                    '#$tag',
                                                                    style: const TextStyle(
                                                                        color: Color(
                                                                            0xff475467),
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    //print("$tag selected");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                    width: 4.0),
                                                                InkWell(
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .cancel,
                                                                    size: 16.0,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  onTap: () {
                                                                    onTagDelete(
                                                                        tag);
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }).toList()),
                                                      )
                                                    : null,
                                              ),
                                              onChanged: onChanged,
                                              onSubmitted: onSubmitted,
                                            ),
                                          );
                                        });
                                      },
                                    );
                                  },
                                ),
                                // Wrap(
                                //     direction: Axis.horizontal,
                                //     spacing: 10.0,
                                //     runSpacing: 10.0,
                                //     children: Salvos.map((option) => new Container(
                                //         child: InkWell(
                                //             onTap: () {
                                //               changeState(option);
                                //             },
                                //             child: Container(
                                //                 decoration: BoxDecoration(
                                //                   color: option['isActive']
                                //                       ? Color(0xffffd25e)
                                //                       : Color(0xfffbd35c),
                                //                   borderRadius:
                                //                   BorderRadius.circular(32),
                                //                 ),
                                //                 height: 40,
                                //                 padding: EdgeInsets.all(10),
                                //                 child: Text('${option['title']}',
                                //                     textAlign: TextAlign.center,
                                //                     style: TextStyle(
                                //                         fontWeight: FontWeight.normal,
                                //                         color: option['isActive']
                                //                             ? Color(0xff4d5867)
                                //                             : Color(
                                //                             0xff868e96)))))))
                                //         .toList()),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Txt("Location"),
                          SizedBox(height: 10),
                          Box("Avenida Braelo, 587", controllers[2]),
                          SizedBox(height: 20),
                          Txt("ZIP Code"),
                          SizedBox(height: 10),
                          Box("SE1 7AB", controllers[3]),
                          SizedBox(height: 20),
                          Txt("Whatsapp"),
                          SizedBox(height: 10),
                          Box("https://wa.me/00000000", controllers[4]),
                          SizedBox(height: 10),
                          controllers[4].text.isNotEmpty
                              ? getTypeSpecificWidgets(controllers)
                              : SizedBox(),
                          SizedBox(height: 10),
                          Txt("Add thumbnail"),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: _pickImage,
                            // Call the function to pick the image
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Color(0xffe5c87e)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 200,
                                  width: Get.width * 0.9,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: _image != null
                                        ? Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          )
                                        : SvgPicture.asset(
                                            "assets/import pic.svg",
                                            fit: BoxFit.scaleDown,
                                          ),
                                  ),
                                ),
                                if (_image != null)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: _clearImage,
                                      // Call the function to clear the image
                                      child: SvgPicture.asset(
                                        "assets/delete_pic.svg",
                                        height: 25,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Txt("Add photos"),
                          SizedBox(height: 10),
                          Container(
                            height: 250,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: pickedImages.length, // Number of boxes
                              itemBuilder: (BuildContext context, int index) {
                                return Box2(context, pickedImages[index],
                                    index); // Pass index here
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 60,
                            width: Get.width * 0.9,
                            child: ElevatedButton(
                                onPressed: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String id = prefs.getString("id").toString();
                                  Map<String, dynamic> body =
                                      generateListingBody(widget.type,
                                          controllers, id.toString());
                                  UserLoginResponse response =
                                      await ApiServicesforListing.addListing(
                                          body, widget.type.toString());
                                  if (response.message == 'success') {
                                    Get.to(() => View_Items());
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            title: Text('Error Message'),
                                            content: Text('${response.error}'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); //close Dialog
                                                },
                                                child: Text('Close'),
                                              )
                                            ],
                                          );
                                        });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xfffcd9403),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    elevation: 0),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: "Plus Jakarta Sans"),
                                )),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> generateListingBody(
      String type, List<TextEditingController> controllers, String id) {
    Map<String, dynamic> body = {
      "userId": id.toString(),
      "title": controllers[0].text.toString(),
      "description": controllers[1].text.toString(),
      "local": controllers[2].text.toString(),
      "postalCode": controllers[3].text.toString(),
      "whatsapp": controllers[4].text.toString(),
      "keywords": _controller.getTags,
      "thumbnail": "https://googleflutter.com/sample_image.jpg",
      "multiplePictures": [
        "https://googleflutter.com/sample_image.jpg",
        "https://googleflutter.com/sample_image.jpg",
        "https://googleflutter.com/sample_image.jpg"
      ],
    };

    if (type == 'Event') {
      body["date"] = "2023-07-15";
      body["time"] = "19:00";
      body["start"] = "19:30";
      body["end"] = "23:00";
      body["website"] = controllers[5].text.toString();
      body["instagram"] = controllers[6].text.toString();
      body["facebook"] = controllers[7].text.toString();
    } else if (type == 'Property') {
      body["price"] = controllers[5].text.toString();
      body["bedroom"] = 1;
      body["bathroom"] = 1;
      body["suites"] = 1;
    } else if (type == 'Advert') {
      body["category"] = "2023-07-15";
      body["subcategory"] = "19:00";
      body["instagram"] = controllers[5].text.toString();
      body["facebook"] = controllers[6].text.toString();
    } else if (type == 'Service' || type == 'Work') {
      body["category"] = "2023-07-15";
      body["subcategory"] = "19:00";
      body["advertiserName"] = controllers[5].text.toString();
      body["approximateValue"] = int.parse(controllers[6].text.toString());
    } else if (type == 'Vehicle') {
      body["subcategory"] = "19:00";
      body["approximateValue"] = int.parse(controllers[6].text.toString());
      body["type"] = controllers[6].text.toString();
    }

    return body;
  }

  Widget getTypeSpecificWidgets(List<TextEditingController> controllers) {
    if (widget.type == 'Event') {
      return Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Date"),
                Txt("Schedule"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Box1("MM/DD/YYYY", controllers[8]),
              Box1("4pm", controllers[9]),
            ],
          ),
          SizedBox(height: 20),
          Txt("Website"),
          SizedBox(height: 10),
          Box("587 Braelo Avenue", controllers[5]),
          SizedBox(height: 20),
          Txt("Instagram "),
          SizedBox(height: 10),
          Box("@braelo.co", controllers[6]),
          SizedBox(height: 20),
          Txt("Facebook "),
          SizedBox(height: 10),
          Box("@braelo.co", controllers[7]),
          SizedBox(height: 20),
        ],
      );
    } else if (widget.type == 'Property') {
      return Column(
        children: [
          SizedBox(height: 20),
          Txt("Price"),
          SizedBox(height: 10),
          Box("\$ 900,00", controllers[5]),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Dorms"),
                Txt("Bathrooms"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Dropdown(items3, controller3)),
              SizedBox(
                width: 30,
              ),
              Expanded(child: Dropdown(items4, controller4))
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt("Suites"),
                Txt("Jobs"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Dropdown(items5, controller5)),
              SizedBox(
                width: 30,
              ),
              Expanded(child: Dropdown(items6, controller6))
            ],
          ),
          SizedBox(height: 20),
        ],
      );
    } else if (widget.type == 'Advert') {
      return Column(
        children: [
          Txt("Category"),
          SizedBox(height: 10),
          Dropdown(items1, controller1),
          SizedBox(height: 20),
          Txt("Subcategory"),
          SizedBox(height: 10),
          Dropdown(items2, controller2),
          SizedBox(height: 20),
          Txt("Instagram "),
          SizedBox(height: 10),
          Box("@braelo.co", controllers[5]),
          SizedBox(height: 20),
          Txt("Facebook "),
          SizedBox(height: 10),
          Box("@braelo.co", controllers[6]),
          SizedBox(height: 20),
        ],
      );
    } else if (widget.type == 'Service' || widget.type == 'Work') {
      return Column(
        children: [
          Txt("Category"),
          SizedBox(height: 10),
          Dropdown(items1, controller1),
          SizedBox(height: 20),
          Txt("Subcategory"),
          SizedBox(height: 10),
          Dropdown(items2, controller2),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Txt("Advertiser name"),
          SizedBox(height: 10),
          Box("Criss Germano", controllers[5]),
          SizedBox(height: 20),
          Txt("Approximate value"),
          SizedBox(height: 10),
          Box("\$180 (hour)", controllers[6]),
        ],
      );
    } else if (widget.type == 'Vehicle') {
      return Column(
        children: [
          Txt("Subcategory"),
          SizedBox(height: 10),
          Dropdown(items2, controller2),
          SizedBox(height: 20),
          Txt("Vehicle Type"),
          SizedBox(height: 10),
          Box("Suzuki", controllers[5]),
          SizedBox(height: 20),
          Txt("Approximate value"),
          SizedBox(height: 10),
          Box("\$180 (hour)", controllers[6]),
        ],
      );
    } else {
      return Container(); // Default empty container
    }
  }

  Widget Txt(
    String txt,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 16,
            color: Color(0xff78828a),
            fontFamily: "Plus Jakarta Sans",
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget Box(String txt, TextEditingController a) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffc9cdd2))),
      height: 60,
      width: Get.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextFormField(
          keyboardType: txt == "SE1 7AB" || txt == "\$ 900,00"
              ? TextInputType.number
              : TextInputType.name,
          controller: a,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }

  Widget Box1(String txt, TextEditingController dateController) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffc9cdd2))),
      height: 60,
      width: MediaQuery.of(context).size.width / 2.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.length == 2) {
              int? month = int.tryParse(value);
              if (month != null && month >= 1 && month <= 12) {
                dateController.text = value + "/";
                dateController.selection = TextSelection.fromPosition(
                    TextPosition(offset: dateController.text.length));
              }
            } else if (value.length == 5) {
              int? day = int.tryParse(value.substring(3, 5));
              int? month = int.tryParse(value.substring(0, 2));

              if (day != null && month != null && month >= 1 && month <= 12) {
                int maxDaysInMonth;

                if (month == 2) {
                  // February
                  maxDaysInMonth = 28; // Leap years are not considered here
                } else if (month == 4 ||
                    month == 6 ||
                    month == 9 ||
                    month == 11) {
                  maxDaysInMonth = 30; // Months with 30 days
                } else {
                  maxDaysInMonth = 31; // Months with 31 days
                }

                if (day >= 1 && day <= maxDaysInMonth) {
                  dateController.text = value + "/";
                  dateController.selection = TextSelection.fromPosition(
                      TextPosition(offset: dateController.text.length));
                }
              }
            }
          },
          controller: dateController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xff868e96))),
        ),
      ),
    );
  }

  Widget Box2(BuildContext context, File? edImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xfffdf7e8),
            ),
            height: MediaQuery.of(context).size.height / 7.5,
            width: MediaQuery.of(context).size.width / 3.5,
            child: GestureDetector(
              onTap: () {
                _showImagePickerDialog(context, index);
              },
              child: edImage != null
                  ? Image.file(
                      edImage,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(
                      "assets/import_Pic1.svg",
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ),
          if (edImage != null)
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pickedImages[index] = null; // Remove the selected image
                  });
                },
                child: SvgPicture.asset(
                  "assets/delete_pic.svg",
                  height: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget Dropdown(List<String> item, TextEditingController control,
      {bool flag = false}) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffb8bec4))),
      child: Padding(
        padding: const EdgeInsets.only(left: 2, top: 5),
        child: CustomDropdown(
          fillColor: Colors.white,
          selectedStyle: TextStyle(fontSize: 16, color: Color(0xff78828a)),
          items: item,
          controller: control,
          onChanged: (value) {
            // Update the controller value when the selection changes
            control.text = value;
            if (flag == true) {
              widget.type = value;
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
