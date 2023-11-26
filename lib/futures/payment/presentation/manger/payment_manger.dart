// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:zosr/core/constant/const.dart';
import 'package:zosr/futures/home/data/models/prodect.dart';
import 'package:zosr/futures/payment/presentation/screen/success_pay_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PaymentManager extends GetxController {
  bool isLoading = false;
  Future<void> makePayment(int amount, String currency) async {
    try {
      isLoading = true;
      update();
      String clientSecret =
          await _getClientSecret((amount * 10).toString(), currency);

      await _initializePaymentSheet(clientSecret);
      isLoading = false;
      update();

      await Stripe.instance.presentPaymentSheet();
 await   Hive.box<ProdectModel>(kfavoriteBox).clear();

      Get.offAll(const SuccessPayScreeen());
    } on StripeConfigException catch (error) {
     Get.defaultDialog(content:const Text('') , title: error.toString());
    }
  }

  num calcTotalPrice({required  List<ProdectModel> Prodects}) {
    num total = 0.0;
    for (var element in Prodects) {
    if ( Hive.box(kNumOfprodect).get(element.id) != null) {

         total += (element.price! *        Hive.box(kNumOfprodect).get(element.id)- element.discountPercentage! *  Hive.box(kNumOfprodect).get(element.id));
    }else {
      total = element.price! -totoalDisount(Prodects: Prodects);
    }
      
    }
    return total;
  }

  num originalPrice({required  List<ProdectModel> Prodects}) {
    num Total = 0.0;
    for (var element in Prodects  ) {
    if ( Hive.box(kNumOfprodect).get(element.id) != null) {
      Total += element.price! *                                    Hive.box(kNumOfprodect).get(element.id);

      
    }else{
      Total += element.price!  ;

    }
    }
    return Total;
  }

  num totoalDisount({required  List<ProdectModel> Prodects}) {
    num Total = 0.0;
    for (var element in Prodects) {
    if ( Hive.box(kNumOfprodect).get(element.id) != null) {
      Total += element.discountPercentage! *         Hive.box(kNumOfprodect).get(element.id);}
      else{
        
      Total += element.discountPercentage!;
      }
    }
    return Total;
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "ahmad",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization':
              'Bearer sk_test_51O5qY9ECPwJK59mwWSQM1TALnoQB8HNWvg9cfSWXzJS89cauYlCVqaLPk0yZNL1vW962s7bsVk1vYTvyNrKbfCMG00NT4eLKZH',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }
}
