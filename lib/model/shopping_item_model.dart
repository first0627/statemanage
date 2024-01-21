class ShoppingItemModel {
  //이름
  final String name;

  //갯수
  final int quantity;

  //구매했는지
  final bool hasBought;

  //매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.hasBought,
    required this.isSpicy,
    required this.quantity,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
      quantity: quantity ?? this.quantity,
    );
  }
}
