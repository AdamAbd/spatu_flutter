import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spatu_flutter/feature/feature.dart';

/// Custom Widget for Text Form Field
/// This text field has validator to check the user input
/// An error will be shown below the text field if the input doesn't meet the validator
///
/// This text field border will change dynamically according to user interaction & input
///
/// This text field can be used for typing password and has a trigger for visibility
/// An icon will be shown if the type of input is password
/// The icon will be the visibility trigger
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required Image prefixImage,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    List<TextInputFormatter>? formatter,
  })  : _textFieldEntity = textFieldEntity,
        _prefixImage = prefixImage,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _formatter = formatter,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final Image _prefixImage;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final List<TextInputFormatter>? _formatter;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _error;
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return TextFormField(
      autofocus: widget._textFieldEntity.isAutofocus ?? false,
      enabled: widget._textFieldEntity.isEnabled,
      controller: widget._textFieldEntity.textController,
      focusNode: widget._textFieldEntity.focusNode,
      inputFormatters: widget._formatter,
      maxLines: widget._maxLines,
      style: AppTextStyle.light.copyWith(
        fontSize: _responsive.getResponsiveSize(
          AppFontSize.normal,
        ),
        color: TextFieldColors.text,
      ),
      decoration: InputDecoration(
        hintText: widget._textFieldEntity.hint,
        hintStyle: AppTextStyle.light.copyWith(
          fontSize: _responsive.getResponsiveSize(
            AppFontSize.normal,
          ),
          color: TextFieldColors.hint,
        ),
        errorText: _error?.toUpperCase(),
        helperText: _error?.toUpperCase(),
        helperStyle: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.small,
          color: StateColors.error,
        ),
        fillColor: widget._textFieldEntity.isEnabled
            ? TextFieldColors.backgroundEnable
            : widget._backgroundDisable,
        border: const UnderlineInputBorder(),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _responsive.getResponsiveSize(
              AppGap.normal,
            ),
          ),
          child: widget._prefixImage,
        ),
        suffixIcon: Visibility(
          visible: widget._textFieldEntity.isPassword,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isObscureText = !_isObscureText;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _responsive.getResponsiveSize(
                  AppGap.normal,
                ),
              ),
              child: Image.asset(
                _isObscureText ? AppIcon.show : AppIcon.hide,
                width: AppIconSize.large,
              ),
              // child: SvgPicture.asset(
              //   _isObscureText
              //       ? TextFieldAssets.visibilityOn
              //       : TextFieldAssets.visibilityOff,
              //   color: (widget._textFieldEntity.focusNode?.hasFocus ?? false)
              //       ? TextFieldColors.iconActive
              //       : TextFieldColors.iconInactive,
              // ),
            ),
          ),
        ),
      ),
      textInputAction: widget._textFieldEntity.textInputAction,
      obscureText: _isObscureText,
      keyboardType: widget._textFieldEntity.keyboardType,
      validator: (value) {
        // Note : https://pub.dev/packages/form_validator (documentations)
        _error = _error = widget._validator?.call(value) ??
            widget._textFieldEntity.validator?.call(value);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {});
        });

        return _error;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class CustomTextFormFieldWithSuffix extends StatelessWidget {
  const CustomTextFormFieldWithSuffix({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required String icon,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
  })  : _textFieldEntity = textFieldEntity,
        _icon = icon,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final String _icon;
  final int _maxLines;
  final Color _backgroundDisable;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _textFieldEntity.label.toUpperCase(),
          style: AppTextStyle.semiBold.copyWith(),
        ),
        const Gap(),
        TextFormField(
          autofocus: _textFieldEntity.isAutofocus ?? false,
          enabled: _textFieldEntity.isEnabled,
          controller: _textFieldEntity.textController,
          focusNode: _textFieldEntity.focusNode,
          style: AppTextStyle.regular.copyWith(
            fontSize: _responsive.getResponsiveSize(
              AppFontSize.normal,
            ),
            color: TextFieldColors.text,
          ),
          maxLines: _maxLines,
          minLines: 1,
          decoration: InputDecoration(
            hintText: _textFieldEntity.hint.toUpperCase(),
            fillColor: _textFieldEntity.isEnabled
                ? Grey.secondary
                : _backgroundDisable,
            suffixIcon: Align(
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Padding(
                padding: EdgeInsets.all(
                  _responsive.getResponsiveSize(
                    AppGap.medium,
                  ),
                ),
                // child: SvgPicture.asset(
                //   _icon,
                //   color: Blue.secondary,
                //   width: _responsive.getResponsiveSize(
                //     AppIconSize.extraSmall,
                //   ),
                //   height: _responsive.getResponsiveSize(
                //     AppIconSize.extraSmall,
                //   ),
                // ),
              ),
            ),
          ),
          textInputAction: _textFieldEntity.textInputAction,
          keyboardType: _textFieldEntity.keyboardType,
        ),
      ],
    );
  }
}

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required Function(String) onChanged,
    required Function() onEditingComplete,
    Color backgroundColor = Grey.secondary,
    bool? autofocus,
  })  : _textFieldEntity = textFieldEntity,
        _onChanged = onChanged,
        _onEditingComplete = onEditingComplete,
        _autofocus = autofocus,
        _backgroundColor = backgroundColor,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final Function(String) _onChanged;
  final Function() _onEditingComplete;
  final bool? _autofocus;
  final Color _backgroundColor;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: widget._autofocus ??
              (widget._textFieldEntity.isAutofocus ?? false),
          enabled: widget._textFieldEntity.isEnabled,
          controller: widget._textFieldEntity.textController,
          focusNode: widget._textFieldEntity.focusNode,
          style: AppTextStyle.regular.copyWith(
            fontSize: _responsive.getResponsiveSize(
              AppFontSize.normal,
            ),
            color: TextFieldColors.text,
          ),
          onEditingComplete: widget._onEditingComplete,
          onChanged: (value) {
            widget._onChanged(value);
          },
          decoration: InputDecoration(
            hintText: widget._textFieldEntity.hint.toUpperCase(),
            fillColor: widget._backgroundColor,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.small),
              ),
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.small),
              ),
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.small),
              ),
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppBorderRadius.small),
              ),
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _responsive.getResponsiveSize(
                  AppGap.small,
                ),
              ),
              child: Icon(
                CupertinoIcons.search,
                color: TextFieldColors.iconActive,
                size: _responsive.getResponsiveSize(
                  AppIconSize.small,
                ),
              ),
            ),
          ),
          textInputAction: widget._textFieldEntity.textInputAction,
          keyboardType: widget._textFieldEntity.keyboardType,
        ),
      ],
    );
  }
}

class CustomOTPTextFormField extends StatefulWidget {
  const CustomOTPTextFormField({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required Function(String) onChanged,
    int maxLines = 1,
    String? Function(String?)? validator,
  })  : _textFieldEntity = textFieldEntity,
        _onChanged = onChanged,
        _validator = validator,
        _maxLines = maxLines,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final Function(String) _onChanged;
  final int _maxLines;
  final String? Function(String?)? _validator;

  @override
  State<CustomOTPTextFormField> createState() => _CustomOTPTextFormFieldState();
}

class _CustomOTPTextFormFieldState extends State<CustomOTPTextFormField> {
  String? _error;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return TextFormField(
      autofocus: widget._textFieldEntity.isAutofocus ?? false,
      enabled: widget._textFieldEntity.isEnabled,
      controller: widget._textFieldEntity.textController,
      focusNode: widget._textFieldEntity.focusNode,
      maxLines: widget._maxLines,
      maxLength: 1,
      buildCounter: (
        context, {
        required currentLength,
        maxLength,
        required isFocused,
      }) =>
          null,
      textAlign: TextAlign.center,
      onChanged: widget._onChanged,
      style: TextFieldTextStyle.bold,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: widget._textFieldEntity.hint.toUpperCase(),
        fillColor: Black.secondary,
        // fillColor: widget._textFieldEntity.isEnabled
        //     ? TextFieldColors.backgroundEnable
        //     : TextFieldColors.backgroundDisable,
        //* Hide error text
        errorMaxLines: 1,
        errorText: _error,
        errorStyle: const TextStyle(
          color: Colors.transparent,
          fontSize: 0,
          height: 00.1,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparant,
            // color: widget._textFieldEntity.textController.text.isEmpty
            //     ? TextFieldColors.enabledBorder
            //     : TextFieldColors.focusedBorder,
            width: widget._textFieldEntity.textController.text.isEmpty ? 1 : 3,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.focusedBorder,
            width: 3,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.errorBorder,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.errorBorder,
          ),
        ),
      ),
      textInputAction: widget._textFieldEntity.textInputAction,
      keyboardType: widget._textFieldEntity.keyboardType,
      validator: (value) {
        // Note : https://pub.dev/packages/form_validator (documentations)
        _error = _error = widget._validator?.call(value) ??
            widget._textFieldEntity.validator?.call(value);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {});
        });

        return _error;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
