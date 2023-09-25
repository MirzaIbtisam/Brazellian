class Property {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> keywords;
  final String price;
  final String bedroom;
  final String bathroom;
  final String suites;
  final String local;
  final String postalCode;
  final String vaccancies;
  final String thumbnail;
  final List<String> multiplePictures;
  final int v;

  Property({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.keywords,
    required this.bathroom,
    required this.bedroom,
    required this.suites,
    required this.vaccancies,
    required this.local,
    required this.postalCode,
    required this.price,
    required this.thumbnail,
    required this.multiplePictures,
    required this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['_id'] ?? "",
      userId: json['userId'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      keywords: List<String>.from(json['keywords'] ?? []),
      price: json['price'],
      bedroom: json['bedroom'],
      vaccancies: json['vaccancies'],
      bathroom: json['bathroom'],
      suites: json['suites'],
      local: json['local'] ?? "",
      postalCode: json['postalCode'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      multiplePictures: List<String>.from(json['multiplePictures'] ?? []),
      v: json['__v'] ?? 0,
    );
  }

}

class PropertysResponse {
  final List<Property>? Propertys;
  PropertysResponse({ this.Propertys});

  factory PropertysResponse.fromJson(Map<String, dynamic> json) {
    return PropertysResponse(
      Propertys: List<Property>.from(
          json['Propertys'].map((property) => Property.fromJson(property))),
    );
  }
}
