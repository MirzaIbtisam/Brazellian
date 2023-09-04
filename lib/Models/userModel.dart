class UserProfile {
  final String? state;
  final String id;
  final String? name;
  final String? email;
  final List<String>? interests;
  final String? accountType;
  final String? location;
  final String? language;
  final String? address;
  final String? complement;
  final String? dateOfBirth;
  final String? zipCode;
  final String? gender;
  final String? city;

  UserProfile({
    this.state,
    required this.id,
    this.name,
    this.email,
    this.interests,
    this.accountType,
    this.location,
    this.language,
    this.address,
    this.complement,
    this.dateOfBirth,
    this.zipCode,
    this.gender,
    this.city
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      state: json['state'],
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      interests: json['interests'] != null
          ? List<String>.from(json['interests'])
          : null,
      accountType: json['accountType'],
      location: json['location'],
      language: json['language'],
      address: json['address'],
      complement: json['complement'],
      dateOfBirth: json['dateOfBirth'],
      zipCode: json['zipCode'],
      gender: json['gender'],
      city: json['city'],
    );
  }
}
