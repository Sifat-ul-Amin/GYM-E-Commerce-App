import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_ecommerce_app/ui/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCQwRBEC7BeuUsI4SlQCXjQGGlgFMchLF8",
        appId: "1:628487914730:web:f12797347996ff34820393",
        messagingSenderId: "628487914730",
        projectId: "gym-e-commerece"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GYM-E-Commarce APP',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("Error");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return SplashScreen();
              }
              return CircularProgressIndicator();
            },
          ),
        );
      },
    );
  }
}
