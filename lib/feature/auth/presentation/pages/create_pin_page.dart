import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.createPin;
  final _formKey = GlobalKey<FormState>();

  void _handlePIN() {
    FocusUtils(context).unfocus();

    if (_formKey.currentState?.validate() == true) {
      final List<String> _pin = [];
      for (final i in _textFieldList) {
        _pin.add(i.textController.text);
      }

      sl<UserCubit>().saveUserPin(pin: _pin.join());
      Navigator.pushNamed(context, PagePath.verifyPin);
    }
  }

  @override
  void initState() {
    super.initState();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final i in _textFieldList) {
      i.textController.clear();
      i.textController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Form(
      key: _formKey,
      child: BaseAuthInputPage(
        button: ButtonPrimary(
          'Create PIN Number',
          onPressed: () => _handlePIN(),
        ),
        title: 'Create your PIN',
        description: 'Last Step. Create your PIN number for security',
        children: [
          Row(
            children: List.generate(
              _textFieldList.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppGap.extraSmall,
                  ),
                  child: CustomOTPTextFormField(
                    textFieldEntity: _textFieldList[index],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index != _textFieldList.length - 1) {
                          FocusManager.instance.primaryFocus!.nextFocus();
                        } else {
                          FocusUtils(context).unfocus();
                        }
                      } else if (index != 0) {
                        FocusManager.instance.primaryFocus!.previousFocus();
                      }
                    },
                    isObscureText: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
