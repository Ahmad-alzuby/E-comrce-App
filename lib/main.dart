import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:zosr/core/constant/payment_api_keys.dart';
import 'package:zosr/core/constant/routersName.dart';
import 'package:zosr/core/localizaton/localization.dart';
import 'package:zosr/core/localizaton/localization_controllaer.dart';
import 'package:zosr/firebase_options.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/routes.dart';
import 'package:zosr/servers/serviers.dart';

void main() async {
  Stripe.publishableKey = paymentApiKeys.puplishKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProdectModelAdapter());

  await Get.put(MYServices().inits());

  await Get.put(MYServices().initialServices());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Zosr());
}

// ignore: must_be_immutable
class Zosr extends StatelessWidget {
  LocaleController controller = Get.put(LocaleController());

  Zosr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleController>(
      builder: (controlar) => GetMaterialApp(
        locale: controlar.language,
        theme: ThemeData(
            fontFamily: controlar.Lang_them,
            brightness: controlar.checkThem().value),
        translations: MyLocal(),
        getPages: GetPagesApp().GetPages,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.cheekScreen,
      ),
    );
  }
}
