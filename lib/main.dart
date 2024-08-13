import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamoon/all_courses_page.dart';
import 'package:mamoon/chats_page.dart';
import 'package:mamoon/my_courses_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(
    const Directionality(
      textDirection: TextDirection.rtl,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('ar', 'AE'),
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: [
            Locale('ar', ''), // Arabic
          ],
          home: AllCoursesPage(),
        );
      },
    );
  }
}
