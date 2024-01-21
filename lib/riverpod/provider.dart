import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/model/shopping_item_model.dart';
import 'package:statemange/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    //  final state = ref.watch(shoppingListProvider);  //이렇게 하면 state가 바뀔때마다 이 함수가 호출됨
    final filterState = ref.watch(filterProvider);
    //이렇게 하면 filterState가 바뀔때마다 이 함수가 호출됨
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
