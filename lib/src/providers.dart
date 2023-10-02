import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hook_infinitelist/src/pagination_notifier.dart';
import 'package:hook_infinitelist/src/pagination_state/pagination_state.dart';
import 'database.dart';

final itemsProvider =
    StateNotifierProvider<PaginationNotifier<Item>, PaginationState<Item>>(
        (ref) {
  return PaginationNotifier(
    itemsPerBatch: 20,
    fetchNextItems: (
      item,
    ) {
      return ref.read(databaseProvider).fetchItems(item);
    },
  )..init();
});

final databaseProvider = Provider<MyDatabase>((ref) => MyDatabase());
