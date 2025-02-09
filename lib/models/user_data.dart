class UserDataModel {
  String uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? dob;
  String? gender;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  String? bloodGroup;
  String? location;

  UserDataModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.dob,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.pinCode,
    required this.bloodGroup,
    required this.location,
  });

  // 🔹 Firebase में डेटा सेव करने के लिए JSON में कन्वर्ट करना
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "dob": dob,
      "gender": gender,
      "city": city,
      "state": state,
      "country": country,
      "pinCode": pinCode,
      "bloodGroup": bloodGroup,
      "location": location,
    };
  }

  // 🔹 Firebase से डेटा लाने के लिए JSON को `UserModel` में कन्वर्ट करना
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      dob: json["dob"] ?? "",
      gender: json["gender"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      country: json["country"] ?? "",
      pinCode: json["pinCode"] ?? "",
      bloodGroup: json["bloodGroup"] ?? "",
      location: json["location"] ?? "",
    );
  }
}
