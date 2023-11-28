
import 'package:flutter/material.dart';
import 'package:zosr/core/shared/text_style.dart';

// ignore: must_be_immutable
class AuthAppBarWidget extends StatelessWidget {
  String text;
    AuthAppBarWidget({
 required   this.text,
    super.key,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      
      leading: const SizedBox(),
      centerTitle: true,
      elevation: 0.0,
    backgroundColor: Colors.transparent,
      title: Text(text,
          style: AppStyleText.textStyle_22.copyWith( )),
    );
  }
}
 