class Property {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> keywords;
  final String date;
  final String time;
  final String start;
  final String end;
  final String local;
  final String postalCode;
  final String website;
  final String instagram;
  final String facebook;
  final String thumbnail;
  final List<String> multiplePictures;
  final int v;

  Property({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.keywords,
    required this.date,
    required this.time,
    required this.start,
    required this.end,
    required this.local,
    required this.postalCode,
    required this.website,
    required this.instagram,
    required this.facebook,
    required this.thumbnail,
    required this.multiplePictures,
    required this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['_id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      keywords: List<String>.from(json['keywords']),
      date: json['date'],
      time: json['time'],
      start: json['start'],
      end: json['end'],
      local: json['local'],
      postalCode: json['postalCode'],
      website: json['website'],
      instagram: json['instagram'],
      facebook: json['facebook'],
      thumbnail: json['thumbnail'],
      multiplePictures: List<String>.from(json['multiplePictures']),
      v: json['__v'],
    );
  }
}

class PropertysResponse {
  final List<Property> Propertys;
  PropertysResponse({required this.Propertys});

  factory PropertysResponse.fromJson(Map<String, dynamic> json) {
    return PropertysResponse(
      Propertys: List<Property>.from(json['Property'].map((Property) => Property.fromJson(Property))),
    );
  }
}
