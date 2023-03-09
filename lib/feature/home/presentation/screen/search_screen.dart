import 'package:flutter/material.dart';

import 'package:spatu_flutter/feature/feature.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextFieldEntity textField = TextFieldEntity.search;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: GestureDetector(
        onTap: () => FocusUtils(context).unfocus(),
        child: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: CustomScrollViewWrapper(
              slivers: [
                CustomSliverSearchBar(
                  textField: textField,
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: "Product"),
                      Tab(text: "Store"),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          const SearchIndicator(
                            query: "Metcon",
                            total: 2,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return const WishlistItem(
                                label: "Metcon 7",
                                brand: "Nike",
                                sold: 52214,
                                price: 1799000,
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SearchIndicator(
                            query: "Metcon",
                            total: 2,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return const WishlistItem(
                                label: "Metcon 7",
                                brand: "Nike",
                                sold: 52214,
                                price: 1799000,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
