class PaymentCard {
  String number;
  String cvv;
  String month;
  String year;

  PaymentCard({
    required this.number,
    required this.cvv,
    required this.month,
    required this.year,
  });

  dynamic toJOSNObject() {
    return {
      "number": this.number,
      "cvv": this.cvv,
      "expiry_month": this.month,
      "expiry_year": this.year,
    };
  }
}
