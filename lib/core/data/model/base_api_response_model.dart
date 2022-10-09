class BaseApiResponseModel<T> {
  final int status;
  final String message;
  final T? data;

  const BaseApiResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseApiResponseModel.fromJson(
    Map<String, Object?> json, {
    T? Function(Object? response)? generatedData,
    String? keyData,
  }) {
    return BaseApiResponseModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: generatedData?.call(json[keyData ?? 'data']),
    );
  }

  Map<String, Object?> toJson(
    Object? Function(T? data) generateJsonData,
  ) =>
      {
        'message': message,
        'status': status,
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
