class Activities {
  final String qty;
  final String symbol;
  final String price;
  final String transactionTime;
  final String side;

  const Activities({
    this.qty,
    this.symbol,
    this.price,
    this.transactionTime,
    this.side
  });
  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(
      qty: json['qty'] as String,
      symbol: json['symbol'] as String,
      price: json['price'],
      transactionTime: json['transaction_time'],
      side: json['side']
    );
  }
}
