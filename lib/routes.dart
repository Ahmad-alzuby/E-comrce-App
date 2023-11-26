// ignore_for_file: non_constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/futures/auth/view/screen/sign_in_screen.dart';
import 'package:zosr/futures/auth/view/screen/forgetPassword/forget_password_screen.dart';
import 'package:zosr/futures/auth/view/screen/sign_up_screen.dart';
import 'package:zosr/futures/details/presentation/view/details_Screen.dart';
import 'package:zosr/futures/home/presentation/screen/home_screen.dart';
import 'package:zosr/futures/language/view/screen/lang_screen.dart';
import 'package:zosr/futures/splash/view/screen/onBordaing.dart';
import 'package:zosr/middleware/loginmidleware.dart';
import 'package:zosr/middleware/mymiddleware.dart';

class GetPagesApp {
  List<GetPage<dynamic>> GetPages = [
    GetPage(
        name: AppRouter.cheekScreen,
        page: () => const LangScreen(),
        middlewares: [MyMiddleware()]),
    GetPage(
      name: AppRouter.langScreen,
      page: () => const LangScreen(),
    ),
    GetPage(
      name: AppRouter.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
        name: AppRouter.cheekLoginScreen,
        page: () => const LoginScreen(),
        middlewares: [IsloginMiddleware()]),
    GetPage(
      name: AppRouter.onboarding,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: AppRouter.signUp,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRouter.forgitPasswordScreen,
      page: () => const ForgitPassword_screen(),
    ),
   
   
  
  
    GetPage(
      name: AppRouter.homeScreen,
      page: () => const HomwScreen(),
    ),
    GetPage(
      name: AppRouter.detailesScreen,
      // ignore: missing_required_param
      page: () => DetaliesView(),
    ),
  ];
}
