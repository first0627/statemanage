import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemange/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              hasBought: false,
              isSpicy: true,
              quantity: 3,
            ),
            ShoppingItemModel(
              name: '라면',
              hasBought: false,
              isSpicy: true,
              quantity: 5,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              hasBought: false,
              isSpicy: false,
              quantity: 10,
            ),
            ShoppingItemModel(
              name: '수박',
              hasBought: false,
              isSpicy: false,
              quantity: 2,
            ),
            ShoppingItemModel(
              name: '카스테라',
              hasBought: false,
              isSpicy: false,
              quantity: 5,
            ),
          ],
        );

  //state는 StateNotifier 여기에 있고, 무조건 super생성자에 들어가는 파라미터 값으로 초기ㅗ하됨
  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
                quantity: e.quantity,
              )
            : e)
        .toList();
  }
}
