class OrderConfirmation{
  final String deliveryMethod;
  final bool giftWrap;
  final String note;

  const OrderConfirmation({
    required this.deliveryMethod,
    required this.giftWrap,
    required this.note,
  });

  OrderConfirmation copyWith({
    String? deliveryMethod,
    bool? giftWrap,
    String? note,
  }) {
    return OrderConfirmation(
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      giftWrap: giftWrap ?? this.giftWrap,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveryMethod': deliveryMethod,
      'giftWrap': giftWrap,
      'note': note,
    };
  }

  factory OrderConfirmation.fromMap(Map<String, dynamic> map) {
    return OrderConfirmation(
      deliveryMethod: map['deliveryMethod'] ?? '',
      giftWrap: map['giftWrap'] ?? false,
      note: map['note'] ?? '',
    );
  }

  @override
  String toString() =>
      'OrderConfirmation(deliveryMethod: $deliveryMethod, giftWrap: $giftWrap, note: $note)';
}