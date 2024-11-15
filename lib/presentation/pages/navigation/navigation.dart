import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:looksy/presentation/pages/history/historypage.dart';
import 'package:looksy/presentation/pages/home/homepage.dart';
import 'package:looksy/presentation/pages/profile/profile_page.dart';
import 'package:looksy/presentation/pages/tips/tips.dart';
import 'package:looksy/presentation/utils/theme.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    TipsPage(),
    const Text('scanpage'),
    const HistoryPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        selectedItemColor: neutralTheme,
        unselectedItemColor: neutralTheme,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: (_selectedIndex == 0)
                ? const Icon(IconsaxBold.home_1, size: 24, color: neutralTheme)
                : const Icon(IconsaxOutline.home, size: 24, color: neutralTheme),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 1)
                ? const Icon(IconsaxBold.magicpen, size: 24, color: neutralTheme)
                : const Icon(IconsaxOutline.magicpen, size: 24, color: neutralTheme),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: neutralTheme,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _selectedIndex == 2 ? IconsaxBold.scan : IconsaxOutline.scan,
                size: 24,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 3)
                ? const Icon(IconsaxBold.document_text, size: 24, color: neutralTheme)
                : const Icon(IconsaxOutline.document_text,
                    size: 24, color: neutralTheme),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 4)
                ? const Icon(IconsaxBold.user, size: 24, color: neutralTheme)
                : const Icon(IconsaxOutline.user, size: 24, color: neutralTheme),
            label: 'Profile',
          ),
        ],
      ),
    ));
  }
}
