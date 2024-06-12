import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mabook_doctor/Firebase/firebase_options.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/Login/model/user_model.dart';
import 'package:mabook_doctor/features/appointments/Controller/appoinment_controller.dart';
import 'package:mabook_doctor/features/chat/controller/chat_controller.dart';
import 'package:mabook_doctor/features/splashScreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('userBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
                ChangeNotifierProvider(create: (context) => AppoinmentController()),
                ChangeNotifierProvider(create: (context) => ChatController()),

      ],
      child: const MaterialApp(
        home: mysplashScreen(),
      ),
    );
  }
}
