import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_app/features/favorite/presentation/pages/favorite_page.dart';

class FavoriteItemCard extends ConsumerWidget {
  final String title;
  final int index;

  const FavoriteItemCard({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          title,
          style: textTheme.titleMedium,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            final favorites = ref.read(favoriteItemsProvider);
            final currentFavorites = [...favorites];
            currentFavorites.removeAt(index);
            ref.read(favoriteItemsProvider.notifier).state = currentFavorites;
          },
        ),
      ),
    );
  }
}