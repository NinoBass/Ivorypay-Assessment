class DatalessDto {
  DatalessDto({
    this.message,
    this.statusCode,
    this.success,
  });

  factory DatalessDto.fromJson(Map<String, dynamic> json) => DatalessDto(
        message: json['message'] as String?,
        statusCode: json['statusCode'] as int?,
        success: json['success'] as bool?,
      );

  String? message;
  int? statusCode;
  bool? success;
}
