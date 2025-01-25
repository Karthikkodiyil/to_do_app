import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view/home_page_view.dart';
import 'package:to_do_app/view/login_view.dart';
import 'package:to_do_app/view_model/auth_viewmodel.dart';
import 'package:to_do_app/view_model/home_page_viewmodel.dart';
  import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthViewmodel(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomePageViewmodel(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
