class HttpValidationError {
  final List<ValidationError> detail;

  HttpValidationError.fromJson(Map<String, dynamic> data)
      : this.detail = List.generate(data['Detail'].length,
            (index) => ValidationError.fromJson(data['Detail'][index]));
}

class ValidationError {
  final dynamic loc;
  final String msg;
  final String type;

  ValidationError.fromJson(Map<String, dynamic> data)
      : this.loc = data['loc'],
        this.msg = data['msg'],
        this.type = data['type'];
}
