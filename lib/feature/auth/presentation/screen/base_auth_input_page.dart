import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class BaseAuthInputPage extends StatelessWidget {
  const BaseAuthInputPage({
    super.key,
    required Widget button,
    required String title,
    required String description,
    required List<Widget> children,
    String? moreDescription,
  })  : _button = button,
        _title = title,
        _description = description,
        _children = children,
        _moreDescription = moreDescription;

  final Widget _button;
  final String _title;
  final String _description;
  final List<Widget> _children;
  final String? _moreDescription;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return GestureDetector(
      onTap: () => FocusUtils(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        bottomSheet: Container(
          margin: const EdgeInsets.all(AppSize.w16),
          height: AppSize.w48,
          width: double.infinity,
          child: _button,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: AppSize.w24),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.w24),
              child: Text(
                _title,
                style: AppTextStyle.medium.copyWith(
                  fontSize: _responsive.getResponsiveFontSize(
                    AppSize.w20,
                  ),
                ),
              ),
            ),
            const Gap(height: AppSize.w24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.w24,
              ),
              child: Text.rich(
                TextSpan(
                  text: _description,
                  children: [
                    TextSpan(
                      text: _moreDescription ?? '',
                      style: AppTextStyle.medium.copyWith(
                        fontSize:
                            _responsive.getResponsiveFontSize(AppSize.w16),
                      ),
                    ),
                  ],
                ),
                style: AppTextStyle.regular.copyWith(
                  fontSize: _responsive.getResponsiveFontSize(
                    AppSize.w16,
                  ),
                ),
              ),
            ),
            const Gap(height: AppSize.w36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.w16),
              child: Column(
                children: _children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
