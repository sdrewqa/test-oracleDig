import 'package:app/features/authentication/providers(view-model)/auth_provider.dart';
import 'package:app/features/home_screen_navigation.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';
import 'features/authentication/ui(view)/screens/auth_onboarding_screen.dart';
import 'features/discover/providers(view-model)/discover_provider.dart';
import 'features/profile/providers(view-model)/profile_provider.dart';
import 'features/search/providers(view-model)/search_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
          ChangeNotifierProvider(create: (_) => DiscoverProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Oracle Digital',
            theme: AppThemes.themeData,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // SPlASH SCREEN
                  return Container(
                    color: const Color.fromARGB(135, 0, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                // Состояние аутентификации (зарегистрирован пользователь или нет)
                if (snapshot.hasData) {
                  return const HomeNavigation();
                } else if (snapshot.hasError) {
                  return Text('Ошибка: ${snapshot.error}');
                }

                return const AuthOnBoardingScreen();
              }),
            ),
            routes: routes,
          );
        });
  }
}
