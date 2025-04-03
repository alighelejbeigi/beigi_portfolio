import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:beigi_portfolio/beigi_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'localization_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    return ThemeProvider(
      initTheme: theme.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: GetMaterialApp(
        title: "Ali Ghelej Beigi",
        debugShowCheckedModeBanner: false,
        themeMode: theme.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: Routes.initial,
        onGenerateRoute: RouterGenerator.generateRoute,
        translations: LocalizationService(),
        locale: locale,
      ),
    );
  }
}
