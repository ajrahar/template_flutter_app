import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/theme/app_theme.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(bottomNavIndexProvider);

    return BottomNavigationBar(
      currentIndex: navIndex,
      onTap: (index) {
        ref.read(bottomNavIndexProvider.notifier).state = index;
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/favorites');
            break;
          case 2:
            context.go('/notifications');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}