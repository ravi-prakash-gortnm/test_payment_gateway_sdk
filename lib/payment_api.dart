// import 'package:dio/dio.dart';
// import 'package:test_payment_gateway_sdk/api_response.dart';
// import 'package:test_payment_gateway_sdk/apis.dart';
// import 'package:test_payment_gateway_sdk/payment_info.dart';



// class PaymentApi {
//   //Innstance of dio class
//   static BaseOptions options = new BaseOptions(
//     connectTimeout: 30000,
//     receiveTimeout: 30000,
//   );
//   static Dio dio = new Dio(options);

//   static Future<APIResponse> chargeCard({
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "email": paymentInfo.email,
//       "amount": paymentInfo.amount,
//       "currency": paymentInfo.currency,
//       "reference": paymentInfo.reference,
//       "metadata": paymentInfo.metadata,
//       "card": {
//         "number": paymentInfo.paymentCard.number,
//         "cvv": paymentInfo.paymentCard.cvv,
//         "expiry_month": paymentInfo.paymentCard.month,
//         "expiry_year": paymentInfo.paymentCard.year
//       },
//     };

//     try {
//       var response = await dio.post(
//         APIs.chargeUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           errorMessage =
//               response.data["data"]["message"] ?? response.data["message"];
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         // final jsonObject = convert.jsonDecode(error.message);
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> sendPIN({
//     required PaymentInfo paymentInfo,
//     required String refrence,
//     required String pin,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "pin": pin,
//       "reference": refrence,
//     };

//     try {
//       var response = await dio.post(
//         APIs.submitPINUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> sendOTP({
//     required String refrence,
//     required String otp,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "otp": otp,
//       "reference": refrence,
//     };

//     try {
//       var response = await dio.post(
//         APIs.submitOTPUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> sendPhone({
//     required String refrence,
//     required String phone,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "phone": phone,
//       "reference": refrence,
//     };

//     try {
//       var response = await dio.post(
//         APIs.submitPhoneUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> verifyTransaction({
//     required String refrence,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     try {
//       var response = await dio.get(
//         //for reading purpose
//         APIs.verifyUrl + "" + refrence,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> sendBirthday({
//     required String refrence,
//     required String dob,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "birthday": dob,
//       "reference": refrence,
//     };

//     try {
//       var response = await dio.post(
//         APIs.submitBirthDayUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> sendAddress({
//     required String refrence,
//     required String address,
//     required String city,
//     required String state,
//     required String zipCode,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "address": address,
//       "city": city,
//       "state": state,
//       "zipcode": zipCode,
//       "reference": refrence,
//     };

//     try {
//       var response = await dio.post(
//         APIs.submitAddressUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> mobileMoneyPayment({
//     required String provider,
//     required String phone,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "email": paymentInfo.email,
//       "amount": paymentInfo.amount,
//       "currency": paymentInfo.currency,
//       "metadata": paymentInfo.metadata,
//       "reference": paymentInfo.reference,
//       "mobile_money": {
//         "phone": phone,
//         "provider": provider,
//       },
//     };

//     try {
//       var response = await dio.post(
//         APIs.chargeUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }

//   static Future<APIResponse> bankPayment({
//     required String code,
//     required String accountNumber,
//     required PaymentInfo paymentInfo,
//   }) async {
//     APIResponse apiResponse;

//     //Preparing request payload
//     final Map<String, dynamic> formDataMap = {
//       "email": paymentInfo.email,
//       "amount": paymentInfo.amount,
//       "currency": paymentInfo.currency,
//       "metadata": paymentInfo.metadata,
//       "reference": paymentInfo.reference,
//       "bank": {
//         "code": code,
//         "account_number": accountNumber,
//       },
//     };

//     try {
//       var response = await dio.post(
//         APIs.chargeUrl,
//         data: formDataMap,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${paymentInfo.secretKey}',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         //format the response data for system to continue operating
//         apiResponse = APIResponse.fromObject(response.data);
//       } else {
//         var errorMessage = "Request Failed. Please try again later";

//         try {
//           //alert the user with the message from the server
//           if (response.data["data"] != null) {
//             errorMessage = response.data["data"]["message"];
//           } else {
//             errorMessage = response.data["message"];
//           }
//         } catch (error) {
//           print("Error Data Getting Failed:: $error");
//         }

//         throw errorMessage;
//       }
//     } catch (error) {
//       DioError dioError = error as DioError;
//       var errorMessage = "Request Failed. Please try again later";

//       try {
//         //alert the user with the message from the server
//         if (dioError.response!.data["data"] != null) {
//           errorMessage = dioError.response!.data["data"]["message"];
//         } else {
//           errorMessage = dioError.response!.data["message"];
//         }
//       } catch (error) {
//         print("Error Data Getting Failed:: $error");
//       }

//       throw errorMessage;
//     }

//     return apiResponse;
//   }
// }
