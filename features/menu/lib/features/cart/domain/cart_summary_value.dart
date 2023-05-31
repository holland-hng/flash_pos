class CartSummary {
  final double tax;
  final double subTotal;
  final double total;
  final int itemCount;

  CartSummary({
    required this.tax,
    required this.subTotal,
    required this.total,
    required this.itemCount,
  });

  factory CartSummary.initialize() {
    return CartSummary(itemCount: 0, subTotal: 0, tax: 0, total: 0);
  }
}
