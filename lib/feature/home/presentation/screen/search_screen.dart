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
                      SingleChildScrollView(
                        child: Column(
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
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SearchIndicator(
                              query: "Metcon",
                              total: 2,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: SearchStoreEntity.list.length,
                              itemBuilder: (context, index) => SearchStoreItem(
                                searchStoreEntity:
                                    SearchStoreEntity.list[index],
                              ),
                            ),
                          ],
                        ),
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
