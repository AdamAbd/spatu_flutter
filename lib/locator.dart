import 'package:get_it/get_it.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Dio
  sl.registerLazySingleton(() => DioClient.dioInit());

  // /// Menu
  // sl.registerLazySingleton(() => MenuCubit());

  /// Page Stack
  sl.registerLazySingleton(() => PageStackCubit());

  /// User
  sl.registerLazySingleton(() => UserCubit());

  ///Auth
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => VerifyCubit(sl()));

  // /// Home
  // sl.registerLazySingleton(() => HomeRepository(sl()));
  // sl.registerLazySingleton(() => HomeRemoteDataSource(sl()));
  // sl.registerFactory(() => HomeBannerCubit(sl()));
  // sl.registerFactory(() => HomeCategoryCubit(sl()));
  // sl.registerFactory(() => HomeMagazineCubit(sl()));

  // /// Categories
  // sl.registerLazySingleton(() => CategoriesRepository(sl()));
  // sl.registerLazySingleton(() => CategoriesRemoteDataSource(sl()));
  // sl.registerFactory(() => CategoriesCubit(sl()));

  // /// Library
  // sl.registerLazySingleton(() => LibraryRepository(sl()));
  // sl.registerLazySingleton(() => LibraryRemoteDataSource(sl()));
  // sl.registerLazySingleton(() => LibraryCubit(sl()));

  // /// Profile
  // sl.registerLazySingleton(() => ProfileRepository(sl()));
  // sl.registerLazySingleton(() => ProfileRemoteDataSource(sl()));
  // sl.registerFactory(() => ProfileEditCubit(sl()));
  // sl.registerFactory(() => ProfileSettingCubit(sl()));
  // sl.registerFactory(() => ProfileContactCubit(sl()));

  // /// Magazine Detail
  // sl.registerLazySingleton(() => MagazineDetailRepository(sl()));
  // sl.registerLazySingleton(() => MagazineDetailRemoteDataSource(sl()));
  // sl.registerFactory(() => MagazineDetailCubit(sl()));
  // sl.registerFactory(() => MagazineCategoryCubit(sl()));
  // sl.registerFactory(() => MagazinePremiumCubit(sl()));
  // sl.registerFactory(() => MagazineFavoriteCubit(sl()));

  // /// Bookmark Detail
  // sl.registerLazySingleton(() => BookmarkRepository(sl()));
  // sl.registerLazySingleton(() => BookmarkRemoteDataSource(sl()));
  // sl.registerFactory(() => BookmarkCubit(sl()));

  // /// Subscription
  // sl.registerLazySingleton(() => SubscriptionRepository(sl()));
  // sl.registerLazySingleton(() => SubscriptionRemoteDataSource(sl()));
  // sl.registerFactory(() => SubscriptionPlanCubit(sl()));
  // sl.registerFactory(() => SubscribeUserCubit(sl()));

  // /// Sign In With Google
  // sl.registerLazySingleton(() => GoogleSigninRemoteDataSource());
  // sl.registerLazySingleton(() => GoogleSigninRepository(sl()));
  // sl.registerFactory(() => GoogleSigninCubit(sl()));

  // /// Notification
  // sl.registerLazySingleton(() => NotificationRemoteDataSource(sl()));
  // sl.registerLazySingleton(() => NotificationRepository(sl()));
  // sl.registerFactory(() => NotificationUserCubit(sl()));
  // sl.registerFactory(() => NotificationUpdateCubit(sl()));

  // /// Filter
  // sl.registerLazySingleton(() => FilterRemoteDataSource(sl()));
  // sl.registerLazySingleton(() => FilterRepository(sl()));
  // sl.registerFactory(() => FilterNewMagazineCubit(sl()));
  // sl.registerFactory(() => FilterRecentMagazineCubit(sl()));
  // sl.registerFactory(() => FilterBrandsMagazineCubit(sl()));
  // sl.registerFactory(() => FilterCountriesMagazineCubit(sl()));
  // sl.registerFactory(() => FilterBrandCubit(sl()));
  // sl.registerFactory(() => FilterCountryCubit(sl()));

  // /// Search
  // sl.registerLazySingleton(() => SearchRemoteDataSource(sl()));
  // sl.registerLazySingleton(() => SearchRepository(sl()));
  // sl.registerFactory(() => SearchAllCubit(sl()));
}
