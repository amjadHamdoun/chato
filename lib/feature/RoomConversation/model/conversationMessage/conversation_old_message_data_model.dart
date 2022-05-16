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
  UserData? user;

  Map<String, dynamic> toJson() => _$ConversationOldMessageDataModelToJson(this);
  factory ConversationOldMessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationOldMessageDataModelFromJson(json);

  ConversationOldMessageDataModel(
      {
         this.id,
         this.conversation_id,
         this.message,
         this.seen,
         this.created_at,
         this.updated_at,
         this.user
      });
}
