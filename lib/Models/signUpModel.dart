class SignUpResponse {
  final String? message;
  final String? error;
  final String? id;

  SignUpResponse({ this.message, this.error,this.id});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('message')&&json.containsKey('id')){
      return SignUpResponse(
        message: json['message'],
        id: json['id'],
      );
    }
    else if(json.containsKey('message')){
      return SignUpResponse(
        message: json['message'],
      );
    }
    return SignUpResponse(
      error: json['error'],
    );
  }

}
class UserLoginResponse {
  final String? message;
  final String? id; // Use String? to allow for null values
  final String? error; // Error message

  UserLoginResponse({
     this.message,
    this.id,
    this.error,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      message: json['message'],
      id: json['id'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': id,
      'error': error,
    };
  }
}
