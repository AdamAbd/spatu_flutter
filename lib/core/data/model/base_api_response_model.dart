class BaseApiResponseModel<T> {
  final int code;
  final String status;
  final String? message;
  final String? errors;
  final T? data;

  const BaseApiResponseModel({
    required this.code,
    required this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory BaseApiResponseModel.fromJson(
    Map<String, Object?> json, {
    T? Function(Object? response)? generatedData,
    // String? keyData,
  }) {
    return BaseApiResponseModel(
      code: int.parse(json['code'].toString()),
      status: json['status'].toString(),
      message: json['message'] as String?,
      errors: json['errors'] as String?,
      data: generatedData?.call(json['data']),
      // data: generatedData?.call(json[keyData ?? 'data']),
    );
  }

  Map<String, Object?> toJson(
    Object? Function(T? data) generateJsonData,
  ) =>
      {
        'code': code,
        'status': status,
        'message': message,
        'errors': errors,
        'data': generateJsonData(data),
      };
}

// class Errors {
//   List<String>? email;

//   Errors({this.email});

//   factory Errors.fromJson(Map<String, dynamic> json) => Errors(
//         email: json['email'] as List<String>?,
//       );

//   Map<String, dynamic> toJson() => {
//         'email': email,
//       };
// }

// class ErrorsModel {
//   List<dynamic>? email;
//   List<dynamic>? languageId;

//   ErrorsModel({this.email, this.languageId});

//   factory ErrorsModel.fromJson(Map<String, dynamic> json) => ErrorsModel(
//         email: json['email'] as List<dynamic>?,
//         languageId: json['language_id'] as List<dynamic>?,
//       );

//   Map<String, dynamic> toJson() => {'email': email, 'language_id': languageId};

//   ErrorsEntity toErrorsEntity() => ErrorsEntity(
//         email: email,
//         languageId: languageId,
//       );
// }
