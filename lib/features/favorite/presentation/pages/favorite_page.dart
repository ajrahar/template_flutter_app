import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:template_app/core/theme/app_theme.dart';
import 'package:template_app/features/favorite/presentation/widgets/favorite_card.dart';

final favoriteItemsProvider = StateProvider<List<String>>((ref) => [
      'Flutter',
      'Dart',
      'Riverpod',
      'Material Design',
    ]);

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteItemsProvider);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorite Items',
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: favorites.isEmpty
                ? Center(
                    child: Text(
                      'No favorites yet',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return FavoriteItemCard(
                        title: favorites[index],
                        index: index,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}