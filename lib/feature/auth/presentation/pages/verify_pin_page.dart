import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class VerifyPinPage extends StatefulWidget {
  const VerifyPinPage({super.key});

  @override
  State<VerifyPinPage> createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.verifyPin;

  void _handlePIN() {
    final List<String> _pin = [];
    for (final i in _textFieldList) {
      _pin.add(i.textController.text);
    }

    print(_pin.join() == sl<UserCubit>().state.pin);
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
    return BaseAuthInputPage(
      button: ButtonPrimary(
        'Create PIN Number',
        onPressed: () => _handlePIN(),
      ),
      title: 'Create your PIN',
      description: 'Last Step. Create your PIN number for security',
      body: [
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
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}