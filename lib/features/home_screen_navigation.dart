import 'package:app/features/authentication/data/repositories/auth_repository.dart';
import 'package:app/features/authentication/ui(view)/screens/auth_onboarding_screen.dart';
import 'package:app/features/chat(just_view)/ui(view)/screens/chats_screen.dart';
import 'package:app/features/discover/ui(view)/screens/discover_screen.dart';
import 'package:app/features/profile/ui(view)/screens/profile_screen.dart';
import 'package:app/features/search/ui(view)/screens/search_screen.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../common/widgets/my_bottom_nav_bar_widget.dart';

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
      bottomNavigationBar: MyBottomNavigationBarWidget(
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
        return Container();
      case 3:
        return const ChatsScreen();
      case 4:
        return const ProfileScreen(isMyProfile: true);
      default:
        return const ProfileScreen(isMyProfile: true);
    }
  }
}
