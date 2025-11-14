import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/get_it_service.dart';

import 'core/routers/app_router.dart';
import 'core/services/prefs_service.dart';
import 'core/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await dotenv.load(fileName: ".env");
  await PrefsService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => child!,
      child: MaterialApp.router(
        title: 'CINEMAX',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
