import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sakni/views/main_navigation_page.dart';

void main() {
  runApp(const SakaniApp());
}

class SakaniApp extends StatelessWidget {
  const SakaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          supportedLocales: [
            const Locale('ar'),
            const Locale('en'),
          ],
          locale: const Locale('ar'),
          localizationsDelegates: [
             GlobalMaterialLocalizations.delegate,
             GlobalWidgetsLocalizations.delegate,
             GlobalCupertinoLocalizations.delegate,



          ],
          checkerboardOffscreenLayers:true ,
          builder: (context, child) {
            // return Directionality(
            //   textDirection: TextDirection.ltr,
            //   child: child!,
            // );
            return child!;
          },
          theme: ThemeData(
            fontFamily: 'Cairo',
          ),
          debugShowCheckedModeBanner: false,
          home: const MainNavigationPage(),
        );
      },
    );
  }
}
