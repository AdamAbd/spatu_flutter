import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await locator.init();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageRouter _router = PageRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: locator.sl<PageStackCubit>(),
        ),
        BlocProvider.value(
          value: locator.sl<UserCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Spatu',
        theme: SpatuTheme().of(context),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _router.getRoute,
      ),
    );
  }
}
