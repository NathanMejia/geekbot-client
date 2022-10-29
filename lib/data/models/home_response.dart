import 'package:geek_bot_client/data/models/user_model.dart';

class HomeResponse {
  int id;
  String name;
  List<UserModel> users;

  HomeResponse({
    required this.id,
    required this.name,
    required this.users,
  });

  factory HomeResponse.fromJsonMap( Map<String,dynamic> jsonMap) =>HomeResponse(
    id    : jsonMap["id"], 
    name  : jsonMap["name"], 
    users : (jsonMap["users"] as List<Map<String,dynamic>>).map(
      (e) => UserModel.fromJsonMap(e)
    ).toList()
  );

}

