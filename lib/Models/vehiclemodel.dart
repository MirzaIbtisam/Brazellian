class Vehicle {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> keywords;
  final String category;
  final String subcategory;
  final String advertiserName;
  final String vehicleType;
  final int approximateValue;
  final String local;
  final String postalCode;
  final String thumbnail;
  final List<String> multiplePictures;
  final int v;

  Vehicle({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.keywords,
    required this.category,
    required this.subcategory,
    required this.advertiserName,
    required this.approximateValue,
    required this.local,
    required this.postalCode,
    required this.vehicleType,
    required this.thumbnail,
    required this.multiplePictures,
    required this.v,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {

    return Vehicle(
      id: json['_id'] ?? "",
      userId: json['userId'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      keywords: List<String>.from(json['keywords'] ?? []),
      category: json['category'] ?? "",
      subcategory: json['subcategory'] ?? "",
      advertiserName: json['advertiserName'] ?? "",
      approximateValue: json['approximateValue'] ?? 0,
      local: json['local'] ?? "",
      postalCode: json['postalCode'] ?? "",
      vehicleType: json['vehicleType'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      multiplePictures: List<String>.from(json['multiplePictures'] ?? []),
      v: json['__v'] ?? 0,
    );
  }
}

class VehiclesResponse {
  final List<Vehicle>? Vehicles;
  VehiclesResponse({ this.Vehicles});

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) {
    print(json['Vehicles'][0]);
    return VehiclesResponse(
      Vehicles: List<Vehicle>.from(json['Vehicles'].map((vehicle) => Vehicle.fromJson(vehicle))),
    );
  }
}
