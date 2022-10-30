class UserModel {
  String id;
  String email;
  String username;
  String realname;
  String profileImg;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.realname,
    required this.profileImg,
  });


  factory UserModel.fromJsonMap( Map<String,dynamic> jsonMap ) => UserModel(
    id          : jsonMap['id'], 
    email       : jsonMap['email'], 
    username    : jsonMap['username'], 
    realname    : jsonMap['realname'], 
    profileImg  : jsonMap['profile_img']
  );
}
