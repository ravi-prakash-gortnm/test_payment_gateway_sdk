import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_payment_gateway_sdk/payment_info.dart';
import 'package:test_payment_gateway_sdk/payment_option.dart';
import 'package:test_payment_gateway_sdk/payment_options_list_view.dart';


class PaymentOptionSelectorView extends StatefulWidget {
  const PaymentOptionSelectorView({
     Key? key,
    required this.paymentOptionslist,
    required this.onItemPressed,
    required this.paymentInfo,
  }) : super(key: key);

  final PaymentInfo paymentInfo;
  final List<PaymentOption> paymentOptionslist;
  final Function onItemPressed;

  @override
  _PaymentOptionSelectorViewState createState() =>
      _PaymentOptionSelectorViewState();
}

class _PaymentOptionSelectorViewState extends State<PaymentOptionSelectorView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "PAYSTACK CHECKOUT",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Use one of the payment methods below to pay",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${widget.paymentInfo.currency} ${widget.paymentInfo.formatedAmount}",
              ),
              SizedBox(
                height: 20,
              ),
              PaymentOptionsListview(
                paymentOptionslist: widget.paymentOptionslist,
                onItemPressed: widget.onItemPressed,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          // Icons.lock,
          FlutterIcons.lock_outline_mdi,
          size: 18,
          color: Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Secured by",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Image(
          image: AssetImage("assets/images/secure_logo.png",
              package: "test_payment_gateway_sdk"),
          height: 30,
          width: 80,
        ),
      ],
    )
      ],
    );
  }
}
