import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geek_bot_client/data/models/home_response.dart';
import 'package:geek_bot_client/data/models/standup_responde_model.dart';
import 'package:geek_bot_client/data/models/user_model.dart';
import 'package:http/http.dart' as http;


class HttpClient {

  // String apiKey = "";

  Future<List<UserModel>> homeScreenRequest(String apiKey)async{

    final uri = Uri.parse("https://api.geekbot.com/v1/teams/");
    final resp = await http.get(uri , headers: {"Authorization" : apiKey});

    if (resp.statusCode != 200){

      debugPrint(resp.body);
      debugPrint(resp.statusCode.toString());
      return[];
    }

    final jsonMap = json.decode(resp.body) as Map<String,dynamic>;
    try {
      final model = HomeResponse.fromJsonMap(jsonMap);
      return model.users;
    } catch (e) {
      throw Exception("Error Casting -> $e");
    }
  }

    Future<List<StandupModel>> standUpRequest(String apiKey)async{

    final uri = Uri.parse("https://api.geekbot.com/v1/standups/");
    final resp = await http.get(uri , headers: {"Authorization" : apiKey});

    if (resp.statusCode != 200){
      debugPrint(resp.body);
      debugPrint(resp.statusCode.toString());
      return[];
    }

    final jsonMap = json.decode(resp.body) as List;
    try {
      final models =  jsonMap.map((e) =>StandupModel.fromJsonMap(e)).toList();
      return models;
    } catch (e) {
      throw Exception("Error Casting -> $e");
    }
  }


  Future<List<ReportStandupModel>> reportStandUpRequest(String apiKey ,String userId , int standUpID)async{

    final uri  = Uri.parse("https://api.geekbot.com/v1/reports/?user_id=$userId&standup_id=$standUpID");
    final resp = await http.get(uri , headers: {"Authorization" : apiKey});

    if (resp.statusCode != 200){
      debugPrint(resp.body);
      debugPrint(resp.statusCode.toString());
      return[];
    }

    final jsonMap = json.decode(resp.body) as List;
    try {
      final models =  jsonMap.map((e) =>ReportStandupModel.fromJsonMap(e)).toList();
      return models;
    } catch (e) {
      throw Exception("Error Casting -> $e");
    }

  }


}












