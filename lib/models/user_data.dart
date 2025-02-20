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

  /// Convert Data in Map(JSON)
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name ?? "",
      "email": email ?? "",
      "phoneNumber": phoneNumber ?? "",
      "profilePicture": profilePicture ?? "",
      "dob": dob ?? "",
      "gender": gender ?? "",
      "city": city ?? "",
      "state": state ?? "",
      "country": country ?? "",
      "pinCode": pinCode ?? "",
      "bloodGroup": bloodGroup ?? "",
      "location": location ?? "",
    };
  }

  /// convert the data from Map(JSON) to UserDataModel
  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      uid: map["uid"] ?? "",
      name: map["name"] as String?,
      email: map["email"] as String?,
      phoneNumber: map["phoneNumber"] as String?,
      profilePicture: map["profilePicture"] as String?,
      dob: map["dob"] as String?,
      gender: map["gender"] as String?,
      city: map["city"] as String?,
      state: map["state"] as String?,
      country: map["country"] as String?,
      pinCode: map["pinCode"] as String?,
      bloodGroup: map["bloodGroup"] as String?,
      location: map["location"] as String?,
    );
  }
}
