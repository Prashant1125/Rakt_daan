class UserDataModel {
  String uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? profilePicture;
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
    this.name,
    this.email,
    this.phoneNumber,
    this.profilePicture,
    this.dob,
    this.gender,
    this.city,
    this.state,
    this.country,
    this.pinCode,
    this.bloodGroup,
    this.location,
  });

  // JSON में कन्वर्ट करना
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "profilePicture": profilePicture,
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

  // JSON से UserDataModel में कन्वर्ट करना
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json["uid"] ?? "",
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      profilePicture: json["profilePicture"],
      dob: json["dob"],
      gender: json["gender"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      pinCode: json["pinCode"],
      bloodGroup: json["bloodGroup"],
      location: json["location"],
    );
  }
}
