class Item {
  final String itemImage;
  final String itemName;
  final double itemPrice;
  int qty;
  Item(
      {required this.itemImage,
      required this.itemName,
      required this.itemPrice, 
      this.qty = 0});
}
