import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_info/core/configs/theme/app_colors.dart';
import 'package:movie_info/presentation/features/home/home_screen.dart';
import 'package:movie_info/presentation/features/people/popular_people_screen.dart';
import 'package:movie_info/presentation/features/search/search_screen.dart';
import 'package:movie_info/presentation/features/top_rated/top_rated_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const TopRatedScreen(),
    const PopularPeopleScreen()
  ];


  void onTap(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
        _pageController.jumpToPage(index);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColors.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: GNav(
              backgroundColor: AppColors.background,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.black38,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'Top Rated',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Film Stars',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: onTap,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onTap,
        children: _screens,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
