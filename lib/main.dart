import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageRouter _router = PageRouter();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: SpatuTheme().of(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _router.getRoute,
    );
  }
}
