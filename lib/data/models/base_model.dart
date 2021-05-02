abstract class BaseModel {

  // JSON Serializable
  BaseModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

}