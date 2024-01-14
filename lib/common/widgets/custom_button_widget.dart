import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final bool buttonThemeIsDark;
  final VoidCallback buttonOnPressed;
  const CustomButtonWidget(
      {super.key,
      required this.buttonText,
      required this.buttonThemeIsDark,
      required this.buttonOnPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonThemeIsDark ? Colors.black : null,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: buttonOnPressed,
        child: Text(buttonText,
            style: buttonThemeIsDark
                ? Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white)
                : Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}
