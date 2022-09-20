import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'locator.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.init();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageRouter _router = PageRouter();

    return BlocProvider.value(
      value: locator.sl<PageStackCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: SpatuTheme().of(context),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _router.getRoute,
      ),
    );
  }
}
