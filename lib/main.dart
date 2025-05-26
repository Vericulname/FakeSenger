import 'package:chat_app_fr_this_time/core/services/database_service.dart';
import 'package:chat_app_fr_this_time/core/utils/route_utils.dart';
import 'package:chat_app_fr_this_time/firebase_options.dart';
import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:chat_app_fr_this_time/ui/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => ChangeNotifierProvider(
            create: (context) => UserProvider(DatabaseService()),
            child: MaterialApp(
              title: 'FakeSenger Demo',
              home: const Splashscreen(),
              onGenerateRoute: RouteUtils.onGenerateRoute,
            ),
          ),
    );
  }
}
