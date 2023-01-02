import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_payment_gateway_sdk/payment_card.dart';

class PaymentInfo {
  String secretKey;
  String reference;
  Widget companyAssetImage;
  int amount;
  String country;
  String currency;
  String email;
  String firstName;
  String lastName;
  dynamic metadata;
 // PaymentCard paymentCard;

  String get formatedAmount {
    double hundredth = this.amount / 100;
    String hundredthInDecimal = NumberFormat("#,###.00").format(hundredth);
    return hundredthInDecimal;
  }

  PaymentInfo({
    required this.secretKey,
    required this.reference,
    required this.companyAssetImage,
    required this.amount,
    required this.country,
    required this.currency,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.metadata,
   // this.paymentCard,
  });
}
