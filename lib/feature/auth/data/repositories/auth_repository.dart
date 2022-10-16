import 'package:dartz/dartz.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class AuthRepository with BaseRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository(this.authRemoteDataSource);

  Future<Either<Failure, BaseApiResponseEntity<UserDataEntity>>> login({
    required String email,
    required String password,
  }) async {
    return catchOrThrow(() async {
      final response = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      final userCubit = sl<UserCubit>();

      if (response.data != null) {
        userCubit.updateUser(userEntity: response.data!.user.toUserEntity());
      }

      return BaseApiResponseEntity.fromBaseApiResponseModel(
        response,
        data: response.data?.toUserDataEntity(),
      );
    });
  }

  Future<Either<Failure, BaseApiResponseEntity<String>>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return catchOrThrow(() async {
      final response = await authRemoteDataSource.register(
        username: username,
        email: email,
        password: password,
      );

      return BaseApiResponseEntity.fromBaseApiResponseModel(
        response,
        data: response.message,
      );
    });
  }

  // Future<Either<Failure, BaseApiResponseEntity<UserEntity>>> loginGoogle({
  //   String? googleId,
  //   String? email,
  //   String? username,
  //   String? picturePath,
  //   String? ipAddress,
  // }) async {
  //   return catchOrThrow(() async {
  //     final response = await authRemoteDataSource.loginGoogle(
  //       googleId: googleId,
  //       email: email,
  //       username: username,
  //       picturePath: picturePath,
  //       ipAddress: ipAddress,
  //     );
  //     final userCubit = sl<UserCubit>();

  //     if (response.data != null) {
  //       userCubit.updateUser(userEntity: response.data!.toUserEntity());
  //     }

  //     return BaseApiResponseEntity.fromBaseApiResponseModel(
  //       response,
  //       data: response.data?.toUserEntity(),
  //     );
  //   });
  // }

  // Future<Either<Failure, BaseApiResponseEntity<SuccessEntity>>> forgotPassword(
  //     {required String email}) async {
  //   return catchOrThrow(() async {
  //     final response = await authRemoteDataSource.forgotPassword(
  //       email: email,
  //     );

  //     return BaseApiResponseEntity.fromBaseApiResponseModel(
  //       response,
  //       data: response.data?.toSuccessEntity(),
  //     );
  //   });
  // }

  // Future<Either<Failure, BaseApiResponseEntity<SuccessEntity>>> logout() async {
  //   return catchOrThrow(() async {
  //     final response = await authRemoteDataSource.logout();

  //     return BaseApiResponseEntity.fromBaseApiResponseModel(
  //       response,
  //       data: response.data?.toSuccessEntity(),
  //     );
  //   });
  // }
}