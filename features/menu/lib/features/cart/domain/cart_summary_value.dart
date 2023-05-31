class CartSummaryValue {
  final double tax;
  final double subTotal;
  final double total;
  final int itemCount;

  CartSummaryValue({
    required this.tax,
    required this.subTotal,
    required this.total,
    required this.itemCount,
  });

  factory CartSummaryValue.initialize() {
    return CartSummaryValue(itemCount: 0, subTotal: 0, tax: 0, total: 0);
  }
}
