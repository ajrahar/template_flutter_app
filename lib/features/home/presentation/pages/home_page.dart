import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:template_app/common/widget/primary_button.dart';
import 'package:template_app/core/theme/app_theme.dart';
import 'package:template_app/features/home/domain/user_model.dart';
import 'package:template_app/common/widget/bottom_navbar.dart';

final userProvider = StateProvider<User>((ref) => User(name: "Pengguna Flutter", age: 25));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(bottomNavIndexProvider);
    
    final pages = [
      const HomeTab(),
      _buildPlaceholderPage("Halaman Favorit"),
      _buildPlaceholderPage("Halaman Profil"),
      _buildPlaceholderPage("Halaman Notifikasi"),
    ];

    return Scaffold(
      body: IndexedStack(index: navIndex, children: pages),
      // Use the new BottomNavBar widget
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildPlaceholderPage(String title) => Center(child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
}

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat Datang!', style: textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Nama: ${user.name}', style: textTheme.titleMedium),
            Text('Umur: ${user.age} tahun', style: textTheme.titleMedium?.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Tambah Umur',
              icon: Icons.add,
              onPressed: () {
                final currentUser = ref.read(userProvider);
                ref.read(userProvider.notifier).state = User(name: currentUser.name, age: currentUser.age + 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}