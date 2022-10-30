
class StandupModel {
  int id;
  String name;
  List<QuestionModel> questions;

  StandupModel({
    required this.id,
    required this.name,
    required this.questions,
  });

  factory StandupModel.fromJsonMap(Map<String,dynamic> jsonMap) => StandupModel(
    id        : jsonMap["id"], 
    name      : jsonMap["name"], 
    questions : (jsonMap["questions"] as List ).map((e) => QuestionModel.fromJsonMap(e)).toList()
  );
}

class QuestionModel {
  int id;
  String color;
  String text;

  QuestionModel({
    required this.id,
    required this.color,
    required this.text,
  });

  factory QuestionModel.fromJsonMap(Map<String,dynamic>jsonMap) => QuestionModel(
    id    : jsonMap["id"], 
    color : jsonMap["color"], 
    text  : jsonMap["text"]
  );
}

class ReportStandupModel {
  int id;
  int timeStamp;
  List<SurveyQuestionModel> questions;

  ReportStandupModel({
    required this.id,
    required this.timeStamp,
    required this.questions,
  });

  factory ReportStandupModel.fromJsonMap(Map<String,dynamic> jsonMap) => ReportStandupModel(
    id        : jsonMap["id"], 
    timeStamp : jsonMap["timestamp"], 
    questions : (jsonMap["questions"] as List ).map((e) => SurveyQuestionModel.fromJsonMap(e)).toList()
  );
}

class SurveyQuestionModel {
  int id;
  String color;
  String question;
  String answer;

  SurveyQuestionModel({
    required this.id,
    required this.color,
    required this.question,
    required this.answer
  });

  factory SurveyQuestionModel.fromJsonMap(Map<String,dynamic>jsonMap) => SurveyQuestionModel(
    id        : jsonMap["id"], 
    color     : jsonMap["color"], 
    question  : jsonMap["question"],
    answer    : jsonMap["answer"]
  );
}