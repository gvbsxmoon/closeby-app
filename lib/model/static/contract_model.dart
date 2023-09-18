import 'package:closeby/model/static/user_model.dart';

class ContractModel {
  late String uuid;
  late String dateRange;
  late UserModel host;
  late UserModel guest;
  
  ContractModel({
    required this.uuid,
    required this.dateRange,
    required this.host,
    required this.guest,
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) {
    return ContractModel(
      uuid: json['uuid'],
      dateRange: json['dateRange'],
      host: UserModel.fromJson(json['host']),
      guest: UserModel.fromJson(json['guest']),
    );
  }
}
