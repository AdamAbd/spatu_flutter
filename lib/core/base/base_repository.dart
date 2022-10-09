import 'package:dartz/dartz.dart';
import 'package:spatu_flutter/core/core.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> catchOrThrow<T>(
    Future<T> Function() body,
  ) async {
    try {
      final data = await body();

      /// If response message is Success or User Created
      if (data is BaseApiResponseEntity && (data.status == 200)) {
        /// Initialize User Cubit
        // final userCubit = sl<UserCubit>();

        // /// Logic when access_token is not null or not empty
        // if (data.accessToken != null && data.accessToken!.isNotEmpty) {
        //   userCubit.saveToken(token: data.accessToken.toString());
        // }

        return Right(data);
      } else {
        return Left(
          Failure(
            message: data is BaseApiResponseEntity
                ? data.message.toString()
                : MessageConstant.defaultErrorMessage,
          ),
        );
      }
    } on BaseException catch (e) {
      return Left(
        Failure(
          message: e.message ?? MessageConstant.defaultErrorMessage,
          error: (e is RemoteException) ? e.error : null,
        ),
      );
    } catch (e) {
      return const Left(Failure(message: MessageConstant.defaultErrorMessage));
    }
  }
}
