import 'package:crypto_mob_app/config/routes.dart';
import 'package:crypto_mob_app/models/models.dart';
import 'package:crypto_mob_app/providers/providers.dart';
import 'package:crypto_mob_app/repositories/repositories.dart';
import 'package:crypto_mob_app/screens/screens.dart';
import 'package:crypto_mob_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (context)=> AuthRepository(auth: FirebaseAuth.instance)),
        ChangeNotifierProvider<LoginProvider>(create: (context)=> LoginProvider(authRepository: context.read<AuthRepository>())),
        ChangeNotifierProvider(create: (context)=> RegisterProvider(authRepository: context.read<AuthRepository>())),
        Provider<ForgotPasswordRepository>(create: (context)=> ForgotPasswordRepository(auth: FirebaseAuth.instance)),
        ChangeNotifierProvider<ForgotPasswordProvider>(create: (context)=> ForgotPasswordProvider(forgotPasswordRepository: context.read<ForgotPasswordRepository>())),
        Provider<ProfileRepository>(create: (context) => ProfileRepository(auth: FirebaseAuth.instance, storage: FirebaseStorage.instance)),
        ChangeNotifierProvider<ProfileProvider>(create: (context)=> ProfileProvider(profileRepository: context.read<ProfileRepository>())),
        ChangeNotifierProvider<UserDetailsProvider>(create: (context)=> UserDetailsProvider()),
        ChangeNotifierProvider<FilePickerProvider>(create: (context)=> FilePickerProvider()),
        Provider<ConversionPriceRepository>(create: (context)=> ConversionPriceRepository()),
        ChangeNotifierProvider(create: (context)=> ConversionPriceProvider(conversionPriceRepository: context.read<ConversionPriceRepository>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
