import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class SearchIndicator extends StatelessWidget {
  const SearchIndicator({
    super.key,
    required String query,
    required int total,
  })  : _query = query,
        _total = total;

  final String _query;
  final int _total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.w24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Result for “$_query”",
              style: AppTextStyle.regular.copyWith(
                fontSize: AppSize.w16,
                color: Blue.primary,
              ),
            ),
          ),
          const Gap(width: AppSize.w24),
          Text(
            "$_total Found",
            style: AppTextStyle.regular.copyWith(
              fontSize: AppSize.w16,
            ),
          ),
        ],
      ),
    );
  }
}
