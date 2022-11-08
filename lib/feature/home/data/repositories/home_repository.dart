import 'package:dartz/dartz.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class HomeRepository with BaseRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepository(this.homeRemoteDataSource);

  Future<Either<Failure, BaseApiResponseEntity<UserDataEntity>>>
      getUserDetail() async {
    return catchOrThrow(() async {
      final response = await homeRemoteDataSource.getUserDetail();

      final userCubit = sl<UserCubit>();

      if (response.data != null) {
        userCubit.saveUser(userEntity: response.data!.user.toUserEntity());
      }

      return BaseApiResponseEntity.fromBaseApiResponseModel(
        response,
        data: response.data?.toUserDataEntity(),
      );
    });
  }
}
