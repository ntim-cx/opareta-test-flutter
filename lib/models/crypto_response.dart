import 'package:opareta_test/models/status.dart';

import 'data.dart';

class CryptoFields {
  static final List<String> values = [
    /// Add all fields
    id, response,
  ];

  static const String id = '_id';
  static const String response = 'response';
}

class CryptoResponse {
  Status status;
  List<Data> data;

  CryptoResponse({status, data});

  CryptoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status.toJson();
    }
    if (data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
