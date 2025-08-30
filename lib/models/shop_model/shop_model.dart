import 'datum.dart';

class ShopModel {
  bool? success;
  String? message;
  List<Datum>? data;

  ShopModel({this.success, this.message, this.data});

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    success: json['success'] as bool?,
    message: json['message'] as String?,
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
