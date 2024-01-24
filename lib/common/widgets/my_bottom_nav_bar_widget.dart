import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../features/authentication/data/repositories/auth_repository.dart';
import '../../features/authentication/ui(view)/screens/auth_onboarding_screen.dart';

// ignore: must_be_immutable
class MyBottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  MyBottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTabSelected});
  List iconList = [
    Assets.icons.house.svg(),
    Assets.icons.magnify.svg(),
    const Icon(Icons.add),
    Assets.icons.chat.svg(),
    Assets.icons.person.svg(),
  ];
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
              for (var i = 0; i < iconList.length; i++)
                _buildNavItem(
                  i,
                  context,
                  iconList[i],
                ),
            ],
          )),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    int index,
    context,
    iconData,
  ) {
    return index == 2
        ? BottomNavigationBarItem(
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
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                                Navigator.pushReplacementNamed(
                                    context, AuthOnBoardingScreen.routeName);
                                var logOut = AuthRepository();
                                logOut.signOut();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: iconData),
            ),
          )
        : BottomNavigationBarItem(
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
