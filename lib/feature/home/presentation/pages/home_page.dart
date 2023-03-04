import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextFieldEntity _textField = TextFieldEntity.search;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    switch (sl<PageStackCubit>().state.page) {
      case 'login':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushReplacementNamed(context, PagePath.login),
        );
        break;
      case 'verify email':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushNamed(
            context,
            PagePath.verifyCode,
            arguments: const VerifyCodePageArgs(verifyType: VerifyType.email),
          ),
        );
        break;
      case 'verify reset':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushNamed(
            context,
            PagePath.verifyCode,
            arguments: const VerifyCodePageArgs(verifyType: VerifyType.reset),
          ),
        );
        break;
      case 'verified':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushReplacementNamed(
            context,
            PagePath.accountVerified,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LogoutCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Form(
            key: _formKey,
            child: GestureDetector(
              onTap: () => FocusUtils(context).unfocus(),
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(height: AppSize.w20),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppSize.w24,
                            right: AppSize.w8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomSearchTextField(
                                  textFieldEntity: _textField,
                                  onChanged: (p0) {},
                                  onEditingComplete: () {},
                                ),
                              ),
                              ButtonIcon(
                                onTap: () {},
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.w16,
                                ),
                                child: const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.w24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Title(title: "Special Offers"),
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      AppIllustration.banner,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.w16),
                                  ),
                                ),
                              ),
                              const Gap(height: AppSize.w12),
                              const Title(title: "Brand Categories"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: AppSize.w64,
                                        height: AppSize.w64,
                                        decoration: const BoxDecoration(
                                          color: Black.secondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(AppSize.w6),
                                          ),
                                        ),
                                      ),
                                      const Gap(height: AppSize.w12),
                                      Text(
                                        "Adidas",
                                        style: AppTextStyle.regular,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: AppSize.w64,
                                        height: AppSize.w64,
                                        decoration: const BoxDecoration(
                                          color: Black.secondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(AppSize.w6),
                                          ),
                                        ),
                                      ),
                                      const Gap(height: AppSize.w12),
                                      Text(
                                        "Adidas",
                                        style: AppTextStyle.regular,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: AppSize.w64,
                                        height: AppSize.w64,
                                        decoration: const BoxDecoration(
                                          color: Black.secondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(AppSize.w6),
                                          ),
                                        ),
                                      ),
                                      const Gap(height: AppSize.w12),
                                      Text(
                                        "Adidas",
                                        style: AppTextStyle.regular,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: AppSize.w64,
                                        height: AppSize.w64,
                                        decoration: const BoxDecoration(
                                          color: Black.secondary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(AppSize.w6),
                                          ),
                                        ),
                                      ),
                                      const Gap(height: AppSize.w12),
                                      Text(
                                        "Adidas",
                                        style: AppTextStyle.regular,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(height: AppSize.w12),
                              const Title(title: "Most Populars"),
                              SizedBox(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: AppSize.w8,
                                    crossAxisSpacing: AppSize.w16,
                                    childAspectRatio: 3 / 4,
                                  ),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 125,
                                          decoration: const BoxDecoration(
                                            color: Black.secondary,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                AppSize.w6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Gap(),
                                        Text(
                                          "Air Zoom SuperRep",
                                          style: AppTextStyle.medium.copyWith(
                                            fontSize: AppSize.w16,
                                          ),
                                        ),
                                        const Gap(height: AppSize.w4),
                                        Row(
                                          children: [
                                            Text(
                                              "Nike · ",
                                              style:
                                                  AppTextStyle.medium.copyWith(
                                                color: Blue.primary,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 6,
                                              ),
                                              margin: const EdgeInsets.only(
                                                left: AppSize.w4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Yellow.primary
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    AppSize.w6,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                "52.214 Sold",
                                                style: AppTextStyle.medium
                                                    .copyWith(
                                                  fontSize: AppSize.w12,
                                                  color: Yellow.primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(height: AppSize.w4),
                                        Text(
                                          "IDR 1.799.000",
                                          style: AppTextStyle.medium.copyWith(
                                            fontSize: AppSize.w16,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
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
            ),
          );
        },
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(height: AppSize.w24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.medium.copyWith(
                fontSize: AppSize.w16,
              ),
            ),
            Text("See All", style: AppTextStyle.light),
          ],
        ),
        const Gap(height: AppSize.w16),
      ],
    );
  }
}
