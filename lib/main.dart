import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './screens/onboarding_service.dart';
import './authentication/app.dart';

const clientId =
    '26323609053-uuc3ve3flb5f2hemdhacsnj6q8upbnch.apps.googleusercontent.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // Transparent navigation bar
    statusBarColor: Colors.transparent, // Transparent status bar
  ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final bool isFirstLaunch = await OnboardingService.isFirstLaunch();
  runApp(MyApp(
    isFirstLaunch: isFirstLaunch,
  ));
}
