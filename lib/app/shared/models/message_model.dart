import 'package:chat_hasura/app/shared/models/user_model.dart';

class MessageModel {
  String content;
  int id;
  UserModel user;

  MessageModel({this.content, this.id, this.user});

  MessageModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    id = json['id'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

  static List<MessageModel> fromJsonList(List list){
    if(list == null) return null;
    return list.map((item) => MessageModel.fromJson(item)).toList();

  }
}