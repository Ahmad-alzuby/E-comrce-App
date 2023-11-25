// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

import 'package:zosr/futures/auth/view/widget/custom_btn.dart';
import 'package:zosr/futures/payment/presentation/screen/success_pay_screen.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';

  String expirDate = '';

  String cardHolderNumber = '';

  String cvvCode = '';

  bool showBackView = true;

  Function onCreditCardWidgetChange = () {};
  GlobalKey<FormState> cardKey = GlobalKey();
  AutovalidateMode autoVaildateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expirDate,
          cardHolderName: cardHolderNumber,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (crediCard) {
            onCreditCardWidgetChange();
          },
        ),
        CreditCardForm(
            onFormComplete: () {},
            autovalidateMode: autoVaildateMode,
            cardNumber: cardNumber,
            expiryDate: expirDate,
            cardHolderName: cardHolderNumber,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel) {
              cardHolderNumber = CreditCardModel.cardHolderName;
              expirDate = CreditCardModel.expiryDate;
              cvvCode = CreditCardModel.cvvCode;
              cardNumber = CreditCardModel.cardNumber;
              showBackView = CreditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: cardKey),
        const SizedBox(
          height: 82,
        ),
        SizedBox(
          height: 60,
          child: CoustemBtnWidget(
              function: () {
                if (cardKey.currentState!.validate()) {
                  cardKey.currentState!.save();

                  Get.to(const SuccessPayScreeen());
                } else {
                  autoVaildateMode = AutovalidateMode.always;
                }
              },
              text: 'Complete Payment',
              backgroundColor: Colors.green),
        ),
      ],
    );
  }
}
