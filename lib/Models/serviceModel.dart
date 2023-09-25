class Service {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> keywords;
  final String local;
  final String postalCode;
  final String category;
  final String subcategory;
  final String advertiserName;
  final int approximateValue;
  final String instagram;
  final String facebook;
  final String thumbnail;
  final List<String> multiplePictures;
  final int v;

  Service({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.keywords,
    required this.local,
    required this.postalCode,
    required this.advertiserName,
    required this.category,
    required this.subcategory,
    required this.approximateValue,
    required this.instagram,
    required this.facebook,
    required this.thumbnail,
    required this.multiplePictures,
    required this.v,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['_id'] ?? "",
      userId: json['userId'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      keywords: List<String>.from(json['keywords'] ?? []),
      category: json['category'] ?? "",
      subcategory: json['subcategory'] ?? "",
      approximateValue: json['approximateValue'] ?? 0,
      advertiserName: json['advertiserName'] ?? "",
      local: json['local'] ?? "",
      postalCode: json['postalCode'] ?? "",
      instagram: json['instagram'] ?? "",
      facebook: json['facebook'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      multiplePictures: List<String>.from(json['multiplePictures'] ?? []),
      v: json['__v'] ?? 0,
    );
  }

}

class ServicesResponse {
  final List<Service>? Services;
  ServicesResponse({ this.Services});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
      Services: List<Service>.from(json['Services'].map((service) => Service.fromJson(service))),
    );
  }
}
