import 'package:json_annotation/json_annotation.dart';


part 'send_message_model.g.dart';

@JsonSerializable()
class SendMessageModel {

  bool? status;
  int? error_code;
  String? message;




  Map<String, dynamic> toJson() => _$SendMessageModelToJson(this);
  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageModelFromJson(json);

  SendMessageModel(
      {

        required this.error_code,
        required this.message,
        required this.status

      });
}
