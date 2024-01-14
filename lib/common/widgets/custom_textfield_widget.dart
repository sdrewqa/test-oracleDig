import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autoFocus;
  final Function? onChangedFun;
  CustomTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      required this.autoFocus,
      this.onChangedFun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        maxLength: 30,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        minLines: 1,
        onChanged: (value) {
          if (onChangedFun == null) return;
          onChangedFun!(value);
        },
        autofocus: autoFocus,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 15,
            ),
        obscureText: hintText == 'Password' ? true : false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(17.0),
          counterText: '',
        ),
      ),
    );
  }
}
