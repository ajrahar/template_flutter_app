import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/widget/header.dart';
import 'package:template_app/features/favorite/presentation/pages/favorite_page.dart';
import 'package:template_app/features/home/presentation/pages/home_page.dart';
import 'package:template_app/common/widget/bottom_navbar.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: const GlobalAppBar(),
            body: child,
            bottomNavigationBar: const BottomNavBar(),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeTab(),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeTab(),
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) => const FavoritePage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Center(
              child: Text('Profile Page', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
            ),
          ),
          GoRoute(path: '/notifications', builder: (context, state) {
            return const Center(
              child: Text('Notifications Page', 
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
            );
          }),
        ],
      ),
    ],
  );
});