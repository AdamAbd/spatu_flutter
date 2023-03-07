import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollViewWrapper(
        slivers: [
          const CustomSliverAppBar(
            title: "Your Profile",
            icon: AppIcon.search,
          ),
          const ProfileUser(
            name: "Bimo Ability",
            email: "abcd1234@gmail.com",
          ),
          const SliverPadding(
            padding: EdgeInsets.only(
              left: AppSize.w24,
              top: AppSize.w36,
              right: AppSize.w24,
              bottom: AppSize.w24,
            ),
            sliver: SliverToBoxAdapter(child: Divider()),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                ProfileEntity.list.length,
                (index) => ProfileItem(
                  profileEntity: ProfileEntity.list[index],
                ),
              ),
            ),
          ),
          const SliverGap(),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required ProfileEntity profileEntity,
  }) : _profileEntity = profileEntity;

  final ProfileEntity _profileEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _profileEntity.onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSize.w24,
          right: AppSize.w24,
          bottom: AppSize.w16,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Black.secondary,
              radius: AppSize.w20,
              child: SvgPicture.asset(
                _profileEntity.icon,
                colorFilter: ColorFilter.mode(
                  _profileEntity.label.contains("Log Out")
                      ? Red.tertiary
                      : AppColors.white,
                  BlendMode.srcIn,
                ),
                width: AppSize.w24,
              ),
            ),
            const Gap(width: AppSize.w12),
            Text(
              _profileEntity.label,
              style: AppTextStyle.medium.copyWith(
                fontSize: AppSize.w16,
                color: _profileEntity.label.contains("Log Out")
                    ? Red.tertiary
                    : AppColors.white,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: _profileEntity.label.contains("Log Out")
                  ? Red.tertiary
                  : AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
    required String name,
    required String email,
  })  : _name = name,
        _email = email;

  final String _name;
  final String _email;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: AppSize.w64,
                ),
                CircleAvatar(
                  radius: AppSize.w16,
                  backgroundColor: Yellow.primary,
                  child: SvgPicture.asset(
                    AppIcon.edit,
                    height: AppSize.w24,
                  ),
                ),
              ],
            ),
          ),
          const Gap(height: AppSize.w16),
          Text(
            _name,
            style: AppTextStyle.medium.copyWith(fontSize: AppSize.w20),
          ),
          const Gap(height: AppSize.w6),
          Text(
            _email,
            style: AppTextStyle.regular.copyWith(color: Blue.primary),
          ),
        ],
      ),
    );
  }
}
