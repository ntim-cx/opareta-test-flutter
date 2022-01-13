class Status {
  String timestamp;
  int errorCode;

  int elapsed;
  int creditCount;

  Status({
    timestamp,
    errorCode,
    elapsed,
    creditCount,
  });

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    return data;
  }
}
