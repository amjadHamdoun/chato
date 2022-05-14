import 'package:json_annotation/json_annotation.dart';

import '../../../User/model/user_data.dart';


part 'conversation_old_message_data_model.g.dart';


@JsonSerializable()
class ConversationOldMessageDataModel {

  int? id;
  String? conversation_id;
  String? message;
  String? seen;
  String? created_at;
  String? updated_at;
  UserData user;

  Map<String, dynamic> toJson() => _$ConversationOldMessageDataModelToJson(this);
  factory ConversationOldMessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationOldMessageDataModelFromJson(json);

  ConversationOldMessageDataModel(
      {
        required this.id,
        required this.conversation_id,
        required this.message,
        required this.seen,
        required this.created_at,
        required this.updated_at,
        required this.user
      });
}
