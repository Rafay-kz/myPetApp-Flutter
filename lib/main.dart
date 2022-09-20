import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pets_app/utils/constants.dart';
import 'package:my_pets_app/utils/route_management.dart';
import 'package:my_pets_app/utils/screen_bindings.dart';

import 'utils/custom_themes/app_theme.dart';
import 'utils/custom_themes/theme_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp(){
ThemeService().theme;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor:
            data.textScaleFactor > 1.2 ? 1.2 : data.textScaleFactor*1.05,
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeService().theme,
      initialBinding: ScreenBindings(),
      getPages: RouteGenerator.getPages(),
      initialRoute: kHomeScreen,
    );
  }
}
