class UserModel {
  String name;
  String image;
  String email;
  String uid;

  UserModel(
      {required this.email,
      required this.image,
      required this.name,
      required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      image: json['image'],
      name: json['name'],
      uid: json['uid'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'image': image,
      'name': name,
      'uid': uid,
    };
  }
}
