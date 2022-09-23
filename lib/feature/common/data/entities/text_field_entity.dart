import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:spatu_flutter/feature/feature.dart';

enum TextFieldStatus {
  initial,
  failed,
  success,
}

class TextFieldEntity {
  TextEditingController textController;
  String hint;
  String label;
  bool isEnabled;
  bool isPassword;
  TextInputType keyboardType;
  bool? isAutofocus;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  String? Function(String?)? validator;

  TextFieldEntity({
    required this.textController,
    required this.hint,
    this.label = "",
    this.isPassword = false,
    this.isEnabled = true,
    this.isAutofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.validator,
  }) {
    // ValidationBuilder.setLocale('id');
  }

  //* Auth
  static final List<TextFieldEntity> login = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your email",
      label: "Email",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().email().build().call(value);
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your password",
      label: "Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().minLength(8).build().call(value);
      },
    ),
  ];

  static final List<TextFieldEntity> register = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your username",
      label: "Username",
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .minLength(2)
            .maxLength(16)
            .build()
            .call(value);
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your email",
      label: "Email",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().email().build().call(value);
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your password",
      label: "Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().minLength(8).build().call(value);
      },
    ),
  ];

  static final List<TextFieldEntity> verify = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      isAutofocus: true,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
  ];

  static final List<TextFieldEntity> createPin = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      isAutofocus: true,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
  ];

  static final List<TextFieldEntity> verifyPin = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      isAutofocus: true,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      focusNode: FocusNode(),
      validator: (value) => ValidationBuilder().required().build().call(value),
    ),
  ];

  static final List<TextFieldEntity> reset = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your email",
      label: "Email",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().email().build().call(value);
      },
    ),
  ];

  static final List<TextFieldEntity> createNewPassword = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your new password",
      label: "Password",
      isPassword: true,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().minLength(8).build().call(value);
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Confirm your new password",
      label: "Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().minLength(8).build().call(value);
      },
    ),
  ];
}
