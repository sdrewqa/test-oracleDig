import 'package:app/core/common/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

import '../../providers(view-model)/auth_provider.dart';
import '../widgets/auth_agreement_widget.dart';
import '../../../../core/common/widgets/custom_textfield_widget.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';
  final String screenTitle;
  final String buttonText;
  final VoidCallback submitFunction;
  final String? agreement;
  const AuthScreen({
    super.key,
    required this.screenTitle,
    required this.submitFunction,
    this.agreement,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthenticationProvider>(context, listen: false);
    var providerT = Provider.of<AuthenticationProvider>(context, listen: true);
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.of(context).pop();
        },
        child: Ink(
          child: Container(
            padding: const EdgeInsets.only(
                top: 16, right: 53, bottom: 32.32, left: 16),
            child: Assets.icons.arrowBackToScreen
                .image(width: 12.21, height: 11.35),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              screenTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFieldWidget(
                hintText: agreement == null ? 'Email' : 'Your Name',
                controller: agreement == null
                    ? provider.emailController
                    : provider.nameController,
                keyboardType: TextInputType.emailAddress,
                autoFocus: true),
            const SizedBox(
              height: 16,
            ),
            agreement == null
                ? CustomTextFieldWidget(
                    hintText: 'Password',
                    controller: provider.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    autoFocus: false,
                  )
                : const SizedBox(),
            SizedBox(
              height: agreement == null ? 16 : 0,
            ),
            CustomButtonWidget(
                buttonText: buttonText,
                buttonThemeIsDark: true,
                buttonOnPressed: () {
                  submitFunction();
                }),
            agreement == null ? const SizedBox() : const AuthAgreementWidget(),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: providerT.isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox(),
            )
          ],
        ),
      ),
    ])));
  }
}
