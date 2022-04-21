import 'package:adomi_app/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:adomi_app/src/providers/providers.dart';
import 'package:adomi_app/src/routes/app_routes.dart';
import 'package:adomi_app/src/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => OfficeService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adomi App',
        initialRoute: 'home',
        routes: AppRoutes.routesApp,
        theme: AppTheme.adomiTheme,
      ),
    );
  }
}
