class BaseResponses<T> {
  bool success;
  T data;
  String errCode;
  String errMsg;
  BaseResponses({this.data, this.errCode, this.errMsg, this.success});
  factory BaseResponses.fromJson(Map<String, dynamic> json) => BaseResponses(
      data: json['data'],
      success: json['success'],
      errCode: json['err_code'],
      errMsg: json['err_msg']);
}
