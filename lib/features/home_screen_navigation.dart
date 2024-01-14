import 'package:app/features/authentication/data/repositories/auth_repository.dart';
import 'package:app/features/authentication/ui(view)/screens/auth_onboarding_screen.dart';
import 'package:app/features/chat(just_view)/ui(view)/screens/chats_screen.dart';
import 'package:app/features/discover/ui(view)/screens/discover_screen.dart';
import 'package:app/features/profile/ui(view)/screens/profile_screen.dart';
import 'package:app/features/search/ui(view)/screens/search_screen.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: _buildBody(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const DiscoverScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return SearchScreen();
      case 3:
        return const ChatsScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const ProfileScreen();
    }
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 0.5,
                  color:
                      Color.fromARGB(71, 0, 0, 0)), // Добавление полосы сверху
            ),
          ),
          height: 86,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentIndex,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            onTap: onTabSelected,
            selectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w100, fontSize: 0),
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavItem(
                currentIndex,
                Assets.icons.house.svg(),
              ),
              _buildNavItem(
                currentIndex,
                Assets.icons.magnify.svg(),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(top: 9),
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 0, 214, 10),
                        Color.fromRGBO(255, 77, 0, 10),
                      ],
                      transform: GradientRotation(33 * 30 / 180),
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(0, 199, 0, 0),
                        elevation: 0,
                      ),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('LOGOUT?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('NO'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushReplacementNamed(context,
                                        AuthOnBoardingScreen.routeName);
                                    var logOut = AuthRepository();
                                    logOut.signOut();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.add)),
                ),
              ),
              _buildNavItem(
                currentIndex,
                Assets.icons.chat.svg(),
              ),
              _buildNavItem(
                currentIndex,
                Assets.icons.person.svg(),
              ),
            ],
          )),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    iconData,
  ) {
    return BottomNavigationBarItem(
      icon: Container(
          margin: const EdgeInsets.only(top: 11),
          padding: const EdgeInsets.all(11),
          height: 40,
          width: 40,
          child: iconData),
      label: '',
    );
  }
}
