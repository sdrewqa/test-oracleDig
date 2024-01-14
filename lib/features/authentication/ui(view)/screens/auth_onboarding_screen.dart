import 'package:app/features/authentication/ui(view)/widgets/auth_userinfo_widget.dart';
import 'package:app/features/authentication/providers(view-model)/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/custom_button_widget.dart';

class AuthOnBoardingScreen extends StatelessWidget {
  const AuthOnBoardingScreen({super.key});
  static const routeName = '/onboarding-screen';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Assets.images.authBack.image(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Center(
                    child: Container(
                        height: 54,
                        margin: const EdgeInsets.only(bottom: 48, right: 1),
                        width: 206,
                        child: Row(children: [
                          SizedBox(
                            width: 38,
                            height: 38,
                            child: Stack(children: [
                              Assets.icons.unionTop.svg(),
                              Assets.icons.unionBottom.svg(),
                            ]),
                          ),
                          const Spacer(),
                          Text(
                            'photo',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 48),
                          )
                        ])),
                  ),
                  const Positioned(
                      bottom: 20, left: 16, child: RowUserInfoWidget())
                ],
              )),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                height: 105,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomButtonWidget(
                          buttonText: 'LOG IN',
                          buttonThemeIsDark: false,
                          buttonOnPressed: () => provider.navigatorToAuthScreen(
                            context,
                            'Log in',
                            () {
                              provider.signIn(context);
                            }, //login
                            'LOG IN',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomButtonWidget(
                            buttonText: 'REGISTER',
                            buttonThemeIsDark: true,
                            buttonOnPressed: () =>
                                provider.navigatorToAuthScreen(
                                  context,
                                  'Register',
                                  () => provider.continueReg(context),
                                  'NEXT',
                                )),
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}
