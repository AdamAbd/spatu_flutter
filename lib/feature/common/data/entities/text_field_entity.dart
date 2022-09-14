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
    ValidationBuilder.setLocale('id');
  }

  //* Auth
  static final List<TextFieldEntity> login = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your Email",
      label: "Email",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder().email().build().call(value)?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Type your password",
      label: "Kata Sandi",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .minLength(8)
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
  ];

  static final TextFieldEntity authForgotPassword = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Masukkan Email",
    label: "Email",
    isAutofocus: true,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
    focusNode: FocusNode(),
    validator: (value) {
      return ValidationBuilder().email().build().call(value)?.toUpperCase();
    },
  );

  static final List<TextFieldEntity> authResetPassword = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Kata Sandi Baru",
      label: "Kata Sandi Baru",
      isPassword: true,
      isAutofocus: true,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .minLength(8)
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Kembali Kata Sandi Baru",
      label: "Konfirmasi Kata Sandi Baru",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .minLength(8)
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
  ];

  static final List<TextFieldEntity> authVerficiation = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      isAutofocus: true,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
    ),
  ];

  static final TextFieldEntity search = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Cari di sini ...",
    isAutofocus: true,
    focusNode: FocusNode(),
    textInputAction: TextInputAction.done,
  );

  static final TextFieldEntity searchCall = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Cari di sini ...",
    isAutofocus: true,
    focusNode: FocusNode(),
    textInputAction: TextInputAction.done,
  );

  static final TextFieldEntity searchApproval = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Cari di sini ...",
    isAutofocus: true,
    focusNode: FocusNode(),
    textInputAction: TextInputAction.done,
  );

  static final List<TextFieldEntity> filterDate = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Tanggal",
      label: "Tanggal Mulai",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Tanggal",
      label: "Tanggal Selesai",
      isEnabled: false,
      focusNode: FocusNode(),
    )
  ];

  static final List<TextFieldEntity> addExpenses = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Tanggal",
      label: "Tanggal",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Nama Pengguna",
      label: "Nama Pengguna",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Aktivitas",
      label: "Aktivitas",
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .required()
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Biaya",
      label: "Biaya",
      keyboardType:
          TextInputType.numberWithOptions(signed: false, decimal: false),
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .required()
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Detail",
      label: "Detail",
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .required()
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Lokasi",
      label: "Lokasi",
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        return ValidationBuilder()
            .required()
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
  ];

  static final TextFieldEntity note = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Masukkan Catatan",
    label: "Catatan (Opsional)",
    textInputAction: TextInputAction.done,
  );

  static final TextFieldEntity noteRequired = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Masukkan Catatan",
    label: "Catatan ",
    textInputAction: TextInputAction.done,
    validator: (value) {
      return ValidationBuilder().required().build().call(value)?.toUpperCase();
    },
  );

  static final TextFieldEntity cancelReason = TextFieldEntity(
    textController: TextEditingController(text: ''),
    hint: "Masukkan Alasan Pembatalan",
    label: "Alasan Pembatalan",
    textInputAction: TextInputAction.done,
  );

  static final List<TextFieldEntity> editProfile = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      label: "Nama",
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      label: "Email",
      isEnabled: false,
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "",
      label: "Nomor Handphone",
      focusNode: FocusNode(),
      keyboardType: TextInputType.number,
      validator: (value) {
        return ValidationBuilder()
            .required()
            .build()
            .call(value)
            ?.toUpperCase();
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Masukkan Kata Sandi",
      label: "Kata Sandi",
      isPassword: true,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
    ),
  ];

  static final List<TextFieldEntity> addCall = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Pilih Nama Pengguna",
      label: "Nama Pengguna",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Pilih Tanggal",
      label: "Tanggal",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "00:00",
      label: "Waktu",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "00:00",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Pilih Gerai",
      label: "Gerai",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Pilih Pelanggan",
      label: "Pelanggan",
      isEnabled: false,
      focusNode: FocusNode(),
    ),
  ];
}
