class SocialUserModel {
  String name;
  String email;
  String phone;
  String uId;
  String image;
  String cover;
  String bio;

  SocialUserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.image,
    this.cover,
    this.bio,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];

  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':image,
      'cover':cover,
      'bio':bio,
    };
  }
}