class Advert {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> keywords;
  final String local;
  final String postalCode;
  final String category;
  final String subcategory;
  final String instagram;
  final String facebook;
  final String thumbnail;
  final List<String> multiplePictures;
  final int v;

  Advert({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.keywords,
    required this.local,
    required this.postalCode,
    required this.category,
    required this.subcategory,
    required this.instagram,
    required this.facebook,
    required this.thumbnail,
    required this.multiplePictures,
    required this.v,
  });

  factory Advert.fromJson(Map<String, dynamic> json) {
    return Advert(
      id: json['_id'] ?? "",
      userId: json['userId'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      keywords: List<String>.from(json['keywords'] ?? []),
      local: json['local'] ?? "",
      postalCode: json['postalCode'] ?? "",
      category: json['category'] ?? "",
      subcategory: json['subcategory'] ?? "",
      instagram: json['instagram'] ?? "",
      facebook: json['facebook'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      multiplePictures: List<String>.from(json['multiplePictures'] ?? []),
      v: json['__v'] ?? 0,
    );
  }

}

class AdvertsResponse {
  final List<Advert>? Adverts;
  AdvertsResponse({this.Adverts});

  factory AdvertsResponse.fromJson(Map<String, dynamic> json) {
    return AdvertsResponse(
      Adverts: List<Advert>.from(json['Adverts'].map((Advert) => Advert.fromJson(Advert))),
    );
  }
}
