import 'package:flutter/material.dart';

import 'package:spatu_flutter/feature/feature.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextFieldEntity textField = TextFieldEntity.search;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: GestureDetector(
        onTap: () => FocusUtils(context).unfocus(),
        child: SafeArea(
          child: CustomScrollViewWrapper(
            slivers: [
              CustomSliverSearchBar(textField: textField),
              const BannerSection(),
              const BrandCategorySection(),
              const PopularProductSection()
            ],
          ),
        ),
      ),
    );
  }
}
