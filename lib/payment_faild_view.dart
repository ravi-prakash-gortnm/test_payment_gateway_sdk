import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_payment_gateway_sdk/payment_info.dart';
import 'package:test_payment_gateway_sdk/payment_option_list_view_item.dart';


class PaymentFailedView extends StatefulWidget {
  PaymentFailedView({
    Key? key,
    required this.paymentInfo,
    required this.message,
    this.title = "Transaction Failed",
  }) : super(key: key);

  final PaymentInfo paymentInfo;
  final String message;
  final String title;

  @override
  _PaymentFailedViewState createState() => _PaymentFailedViewState();
}

class _PaymentFailedViewState extends State<PaymentFailedView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        //Header View
       Row(
      children: <Widget>[
        //Company/app logo
        Container(
          width: 30,
          height: 30,
          child: widget.paymentInfo.companyAssetImage ??
              Image(
                image: AssetImage(
                  "assets/images/secure_logo.png",
                  package: "paystack_manager",
                ),
              ),
        ),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //Customer email address
              Text(widget.paymentInfo.email),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Pay "),
                  Text(
                    "${widget.paymentInfo.currency} ${widget.paymentInfo.formatedAmount}",
                    style: TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
        Divider(
          height: 30,
        ),
        Icon(
          //Icons.close,
          FlutterIcons.error_mdi,
          size: 48,
          color: Colors.red,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            widget.message,
            style: TextStyle(
              color:Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        SecuredByFooter(),
      ],
    );
  }
}
