import 'package:flutter/material.dart';

class AuthAgreementWidget extends StatelessWidget {
  const AuthAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 13, color: Colors.black),
          children: const <TextSpan>[
            TextSpan(
              text: 'By signing up, you agree to Photo’s ',
            ),
            TextSpan(
              text: 'Terms of Service ',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: 'and ',
            ),
            TextSpan(
              text: 'Privacy Policy.',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
