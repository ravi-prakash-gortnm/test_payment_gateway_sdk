import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_payment_gateway_sdk/payment_option.dart';
import 'package:test_payment_gateway_sdk/ui_color.dart';

class PaymentOptionListViewItem extends StatelessWidget {
  const PaymentOptionListViewItem({
     Key? key,
     required this.paymentOption,
    required this.onPressed,
  }) : super(key: key);

  final PaymentOption paymentOption;
  final VoidCallback  onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                paymentOption.iconData,
                size: 16,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Pay with ${paymentOption.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




class SecuredByFooter extends StatelessWidget {
  const SecuredByFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          // Icons.lock,
          FontAwesome.lock,
          size: 18,
          color: UIColors.primaryColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Secured by",
          style: TextStyle(
            color: UIColors.primaryColor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Image(
          image: AssetImage("assets/images/paystack.png",
              package: "paystack_manager"),
          height: 30,
          width: 80,
        ),
      ],
    );
  }
}
