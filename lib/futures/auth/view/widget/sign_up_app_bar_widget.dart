
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zosr/core/shared/text_style.dart';

class AuthAppBarWidget extends StatelessWidget {
  const AuthAppBarWidget({
    super.key,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      
      leading: const SizedBox(),
      centerTitle: true,
      elevation: 0.0,
    backgroundColor: Colors.transparent,
      title: Text('signUp'.tr,
          style: AppStyleText.textStyle_22.copyWith( )),
    );
  }
}
 