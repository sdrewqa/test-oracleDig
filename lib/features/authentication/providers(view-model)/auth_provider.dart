import 'package:app/features/authentication/data/repositories/auth_repository.dart';
import 'package:app/features/authentication/ui(view)/screens/auth_screen.dart';
import 'package:app/features/home_screen_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// VIEW MODEL provider
class AuthenticationProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  // ignore: unused_field
  User? _currentUser;
  // User? get currentUser => _currentUser;
  bool isLoading = false;

  Future<void> signUp(
      String email, String password, String userName, context) async {
    try {
      _currentUser = await _authRepository.signUp(email, password, userName);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeNavigation()),
      );
    } catch (e) {
      isLoading = false;
      snackBar(context, e.toString());
      notifyListeners();
    }
  }

  Future<void> signIn(context) async {
    isLoading = true;
    notifyListeners();
    try {
      _currentUser = await _authRepository.signIn(
          emailController.text, passwordController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeNavigation()),
      );
    } catch (e) {
      snackBar(context, e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _currentUser = null;
    notifyListeners();
  }

  void snackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1000),
    ));
  }

  // View logic onboading screen
  void continueReg(BuildContext context) {
    if (emailController.text.trim().isEmpty ||
        !emailController.text.contains('@')) {
      snackBar(context, "Invalid email");
      return;
    }
    if (passwordController.text.trim().length < 6) {
      snackBar(context, "Invalid password");
      return;
    }
    nameController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AuthScreen(
                screenTitle: 'Register',
                submitFunction: () {
                  if (nameController.text.trim().isEmpty) {
                    snackBar(context, "Invalid email");
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  isLoading = true;
                  notifyListeners();
                  signUp(emailController.text, passwordController.text,
                      nameController.text, context);
                  isLoading = false;
                  notifyListeners();
                }, //sign UP fun ^
                buttonText: 'SIGN UP',
                agreement:
                    'By signing up, you agree to Photo’s Terms of Service and Privacy Policy.',
              )),
    );
  }

  void navigatorToAuthScreen(context, String screenTitle,
      VoidCallback submitFunction, String buttonText) {
    clearControllers();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AuthScreen(
                screenTitle: screenTitle,
                submitFunction:
                    submitFunction, // if its Register, then we, call subm func
                buttonText: buttonText,
              )),
    );
  }

  // view logic auth screen
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void clearControllers() {
    for (var i in [emailController, passwordController, nameController]) {
      i.clear();
    }
    notifyListeners();
  }
}
