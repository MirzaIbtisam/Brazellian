import 'package:brazeellian_community/ViewModel/AdvertsViewModel/advertsViewModel.dart';
import 'package:brazeellian_community/ViewModel/EventsViewModel/eventsViewModel.dart';
import 'package:brazeellian_community/ViewModel/JobsViewModel/JobsViewModel.dart';
import 'package:brazeellian_community/ViewModel/PropertyViewModel/propertyViewModel.dart';
import 'package:brazeellian_community/ViewModel/ServiceViewModel/ServiceViewModel.dart';
import 'package:brazeellian_community/ViewModel/VehicleViewModel/VehicleViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../ViewModel/DefaultViewModel/DefaultViewModel.dart';
import '../../Widgets/Widgets.dart';

class Multi_List extends StatefulWidget {
  final int page;
  Multi_List({super.key, required this.page});
  @override
  State<Multi_List> createState() => _Multi_ListState();
}

class _Multi_ListState extends State<Multi_List> with SingleTickerProviderStateMixin {

  DefaultViewModel defaultViewModel = Get.put(DefaultViewModel());
  ServiceViewModel serviceViewModel = Get.put(ServiceViewModel());
  EventsViewModel eventsViewModel = Get.put(EventsViewModel());
  VehicleViewModel vehicleViewModel = Get.put(VehicleViewModel());
  AdvertsViewModel advertViewModel = Get.put(AdvertsViewModel());
  JobsViewModel jobViewModel = Get.put(JobsViewModel());
  PropertyViewModel propertyViewModel = Get.put(PropertyViewModel());
  static const List<String> _pickLanguage = <String>['c', 'c++', 'java', 'python', 'javascript', 'php', 'sql', 'yaml', 'gradle', 'xml', 'html', 'flutter', 'css', 'dockerfile'];
  double _distanceToField = 2.0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.page,
      length: 2,
      child: Obx(
          ()=>Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
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
                              color: const Color(0xffececec),
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
                          defaultViewModel.type.value.text,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Plus Jakarta Sans",
                              color: Color(0xff111111)),
                        ),
                        const SizedBox(width: 35),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
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
                                  color: const Color(0xffcd9403),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 20,
                                width: 20,
                                child: const Center(
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
                              const SizedBox(width: 15),
                              const Text(
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
                        SizedBox(
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
                                  color: const Color(0xffacb6be),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 20,
                                width: 20,
                                child: const Center(
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
                              const SizedBox(width: 15),
                              const Text(
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
                              const Divider(
                                color: Color(0xffececec),
                                thickness: 0.5,
                              ),
                              const SizedBox(height: 10),
                              Txt("Select the Listing type"),
                              const SizedBox(height: 10),
                              Dropdown(items, defaultViewModel.type.value, ),
                              const SizedBox(height: 20),
                              Txt("Listing title"),
                              const SizedBox(height: 10),
                              Box("The Power of the Network  |", defaultViewModel.titleController.value),
                              const SizedBox(height: 20),
                              Txt("Description"),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: const Color(0xffc9cdd2))),
                                height: 150,
                                width: Get.width * 0.9,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                                  child: TextFormField(
                                    maxLines: 5,
                                    controller: defaultViewModel.descriptionController.value,
                                    decoration: const InputDecoration(
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
                              const SizedBox(height: 20),
                              Txt("Keywords"),
                              const SizedBox(height: 8),
                              const Align(
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
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: const Color(0xffc9cdd2))),
                                height: 100,
                                width: Get.width * 0.9,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
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
                                                  itemBuilder: (BuildContext context, int index) {
                                                    final dynamic option = options.elementAt(index);
                                                    return TextButton(
                                                      onPressed: () {
                                                        onSelected(option);
                                                        defaultViewModel.tags.value.addTag=option;
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
                                        defaultViewModel.tags.value.addTag = selectedTag;
                                      },
                                      fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
                                        return TextFieldTags(
                                          textEditingController: ttec,
                                          focusNode: tfn,
                                          textfieldTagsController: defaultViewModel.tags.value,
                                          initialTags: const [],
                                          textSeparators: const [' ', ','],
                                          letterCase: LetterCase.normal,
                                          validator: (String tag) {
                                            if (tag == 'php') {
                                              return 'No, please just no';
                                            } else if (defaultViewModel.tags.value.getTags!.contains(tag)) {
                                              return 'you already entered that';
                                            }
                                            return null;
                                          },
                                          inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
                                            return ((context, sc, tags, onTagDelete) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                                child: TextField(
                                                  controller: tec,
                                                  focusNode: fn,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: defaultViewModel.tags.value.hasTags
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
                                                                    color: const Color(
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

                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Txt("Location"),
                              const SizedBox(height: 10),
                              Box("Avenida Braelo, 587", defaultViewModel.localController.value,),
                              const SizedBox(height: 20),
                              Txt("ZIP Code"),
                              const SizedBox(height: 10),
                              Box("SE1 7AB",  defaultViewModel.postalCodeController.value,),
                              const SizedBox(height: 20),
                              Txt("Whatsapp"),
                              const SizedBox(height: 10),
                              Box("https://wa.me/00000000", defaultViewModel.whatsappController.value,),
                              const SizedBox(height: 10),
                              Obx(
                                  ()=> getTypeSpecificWidgets(defaultViewModel.type.value.text,context)
                              ),
                              const SizedBox(height: 10),
                              Txt("Add thumbnail"),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: ()=>defaultViewModel.pickImage(),
                                // Call the function to pick the image
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                        Border.all(color: const Color(0xffe5c87e)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: 200,
                                      width: Get.width * 0.9,
                                      child: Obx(
                                              ()=>ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: defaultViewModel.image != null
                                                ? Image.file(
                                              defaultViewModel.image!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            )
                                                : SvgPicture.asset(
                                              "assets/import pic.svg",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          )
                                      ),
                                    ),
                                    if (defaultViewModel.image != null)
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: ()=>defaultViewModel.clearImage(),
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
                              const SizedBox(height: 20),
                              Txt("Add photos"),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 250,
                                child: GridView.builder(
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: defaultViewModel.images.length, // Number of boxes
                                  itemBuilder: (BuildContext context, int index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Obx(()=>Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xfffdf7e8),
                                            ),
                                            height: MediaQuery.of(context).size.height / 7.5,
                                            width: MediaQuery.of(context).size.width / 3.5,
                                            child: GestureDetector(
                                              onTap: ()=>defaultViewModel.pickImages(index),
                                              child: defaultViewModel.images[index] != null
                                                  ? Image.file(
                                                defaultViewModel.images[index]!,
                                                fit: BoxFit.cover,
                                              )
                                                  : SvgPicture.asset(
                                                "assets/import_Pic1.svg",
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                          if (defaultViewModel.images[index] != null)
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              child: GestureDetector(
                                                onTap: ()=>defaultViewModel.clearImages(index),
                                                child: SvgPicture.asset(
                                                  "assets/delete_pic.svg",
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                        ],
                                      )),
                                    ); // Pass index here
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 60,
                                width: Get.width * 0.9,
                                child: ElevatedButton(
                                    onPressed: (){
                                      print(defaultViewModel.type.value.text.toString());
                                      if(defaultViewModel.type.value.text.toString()=="Event"){
                                        eventsViewModel.addEvents();
                                      }else if(defaultViewModel.type.value.text.toString()=="Property"){
                                        propertyViewModel.addProperty();
                                      }else if(defaultViewModel.type.value.text.toString()=="Advert"){
                                        advertViewModel.addAdverts();
                                      }else if(defaultViewModel.type.value.text.toString()=="Service"){
                                        serviceViewModel.addService();
                                      }else if(defaultViewModel.type.value.text.toString()=="Work"){
                                        jobViewModel.addJobs();
                                      }else if(defaultViewModel.type.value.text.toString()=="Vehicle"){
                                        vehicleViewModel.addVehicle();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xfffcd9403),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        elevation: 0),
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontFamily: "Plus Jakarta Sans"),
                                    )),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
      ),
    );
  }
}
