class GeneralResponse {
  GeneralResponse({this.error, this.success});

  String error = "";
  bool success = false;

  GeneralResponse.fromJson({bool success, String error}) {
    this.success = success;
    this.error = error;
  }
}
