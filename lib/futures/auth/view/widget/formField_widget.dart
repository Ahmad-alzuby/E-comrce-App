// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFormFiledWidget extends StatefulWidget {
  String? Function(String?) validator;
  String hintText;
  String label;
  Icon? icondata;

  TextEditingController textEditingController;
  bool obscureText;
  Function()? onpress;
  TextFormFiledWidget({
    this.onpress,
    this.obscureText = false,
    Key? key,
    required this.validator,
    required this.hintText,
    required this.label,
    @required this.icondata,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<TextFormFiledWidget> createState() => _TextFormFiledWidgetState();
}

class _TextFormFiledWidgetState extends State<TextFormFiledWidget> {
  Icon icon = const Icon(Icons.lock_outline);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText.tr,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: widget.onpress != null
              ? widget.onpress != null
                  ? GestureDetector(
                      onTap: () => widget.onpress!(),
                      child:widget.icondata)
                  : widget.icondata
              : const SizedBox(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(widget.label.tr),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
      ),
    );
  }
}
