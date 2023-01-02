import 'package:test_payment_gateway_sdk/transaction_status.dart';

class APIResponse {
  bool status;
  String statusMessage;
  dynamic data;
  String reference;
  String dataMessage;
  TransactionState nextAction;
  String displayText;
  String gatewayResponse;
  String authUrl;

  APIResponse({
    required this.status,
    required this.statusMessage,
    this.data,
    required this.reference,
    required this.dataMessage,
    required this.gatewayResponse,
    required this.nextAction,
    required this.displayText,
    required this.authUrl,
  });

  factory APIResponse.fromObject(dynamic object) {
    final apiResponse = APIResponse(authUrl: '', dataMessage: '', displayText: '', gatewayResponse: '', nextAction: TransactionState.Idle, reference: '', status:false, statusMessage: '');
    apiResponse.status = object["status"];
    apiResponse.statusMessage = object["message"];
    apiResponse.data = object["data"];
    apiResponse.reference = apiResponse.data["reference"];
    apiResponse.dataMessage = apiResponse.data["message"] ?? "";
    apiResponse.displayText = apiResponse.data["display_text"] ?? "";
    apiResponse.gatewayResponse = apiResponse.data["gateway_response"] ?? "";
    apiResponse.authUrl = apiResponse.data["url"] ?? "";

    TransactionState mNextAction = TransactionState.PENDING;

    switch (apiResponse.data["status"]) {
      case "pending":
        mNextAction = TransactionState.PENDING;
        break;
      case "failed":
        mNextAction = TransactionState.FAILED;
        break;
      case "success":
        mNextAction = TransactionState.SUCCESS;
        break;
      case "send_otp":
        mNextAction = TransactionState.SEND_OTP;
        break;
      case "send_pin":
        mNextAction = TransactionState.SEND_PIN;
        break;
      case "send_phone":
        mNextAction = TransactionState.SEND_PHONE;
        break;
      case "send_birthday":
        mNextAction = TransactionState.SEND_BIRTHDATE;
        break;
      case "pay_offline":
        mNextAction = TransactionState.PAY_OFFLINE;
        break;
      case "send_address":
        mNextAction = TransactionState.SEND_ADDRESS;
        break;
      case "open_url":
        mNextAction = TransactionState.SEND_AUTH_URL;
        break;
      case "ongoing":
        mNextAction = TransactionState.FAILED;
        break;
      default:
        mNextAction = TransactionState.PENDING;
        break;
    }

    apiResponse.nextAction = mNextAction;

    return apiResponse;
  }
}
