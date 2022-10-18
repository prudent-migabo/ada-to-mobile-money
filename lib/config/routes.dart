import 'package:crypto_mob_app/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print(settings.name);
    switch(settings.name){
      case SplashScreen.routeName :
        return SplashScreen.route();
      case LoginScreen.routeName :
        return LoginScreen.route();
      case RegisterScreen.routeName :
        return RegisterScreen.route();
      case SuccessfulRegistrationScreen.routeName :
        return SuccessfulRegistrationScreen.route();
      case HomeScreen.routeName :
        return HomeScreen.route();
      case BottomNavigationScreen.routeName :
        return BottomNavigationScreen.route();
      case DashboardScreen.routeName :
        return DashboardScreen.route();
      case EmailVerificationScreen.routeName :
        return EmailVerificationScreen.route();
      case ForgotPasswordScreen.routeName :
        return ForgotPasswordScreen.route();
      case ConvertAdaScreen.routeName:
        return ConvertAdaScreen.route();
      case ConvertMobileScreen.routeName:
        return ConvertMobileScreen.route();
      case CreateWalletScreen.routeName:
        return CreateWalletScreen.route();
      case RecoveryPhraseScreen.routeName:
        return RecoveryPhraseScreen.route();
      case VerifyRecoveryPhrase.routeName:
        return VerifyRecoveryPhrase.route();
      case MyWalletsScreen.routeName:
        return MyWalletsScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case TransactionScreen.routeName :
        return TransactionScreen.route();
      case TransactionDetailsScreen.routeName :
        return TransactionDetailsScreen.route();
      case SuccessfulCreationWallet.routeName :
        return SuccessfulCreationWallet.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (context){
          return Scaffold();
        });

  }
}