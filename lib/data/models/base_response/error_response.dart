class ErrorMessageModel {
  String? message;
  String? error;

  ErrorMessageModel({this.message, this.error});

  ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
  }
}
