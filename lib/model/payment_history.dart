/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PaymentHistory paymentHistoryFromJson(String str) =>
    PaymentHistory.fromJson(json.decode(str));

String paymentHistoryToJson(PaymentHistory data) => json.encode(data.toJson());

class PaymentHistory {
  PaymentHistory({
    required this.d,
    required this.data,
    required this.message,
    required this.status,
  });

  D d;
  List<Datum> data;
  String message;
  bool status;

  factory PaymentHistory.fromJson(Map<dynamic, dynamic> json) => PaymentHistory(
        d: D.fromJson(json["d"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "d": d.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class D {
  D();

  factory D.fromJson(Map<dynamic, dynamic> json) => D();

  Map<dynamic, dynamic> toJson() => {};
}

class Datum {
  Datum({
    this.couponCode,
    this.orderNumber,
    required this.paymentStatus,
    required this.createdAt,
    this.dicountAmount,
    required this.userId,
    this.totalAmount,
    this.netPayableAmount,
    this.tranxId,
    required this.qty,
    this.orderUuid,
    this.currency,
    required this.id,
    required this.modeOfPayment,
  });

  String? couponCode;
  String? orderNumber;
  int paymentStatus;
  DateTime createdAt;
  String? dicountAmount;
  int userId;
  String? totalAmount;
  String? netPayableAmount;
  String? tranxId;
  int qty;
  String? orderUuid;
  String? currency;
  int id;
  int modeOfPayment;

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        couponCode: json["coupon_code"],
        orderNumber: json["order_number"],
        paymentStatus: json["payment_status"],
        createdAt: DateTime.parse(json["created_at"]),
        dicountAmount: json["dicount_amount"],
        userId: json["user_id"],
        totalAmount: json["total_amount"],
        netPayableAmount: json["net_payable_amount"],
        tranxId: json["tranx_id"],
        qty: json["qty"],
        orderUuid: json["order_uuid"],
        currency: json["currency"],
        id: json["id"],
        modeOfPayment: json["mode_of_payment"],
      );

  Map<dynamic, dynamic> toJson() => {
        "coupon_code": couponCode,
        "order_number": orderNumber,
        "payment_status": paymentStatus,
        "created_at": createdAt.toIso8601String(),
        "dicount_amount": dicountAmount,
        "user_id": userId,
        "total_amount": totalAmount,
        "net_payable_amount": netPayableAmount,
        "tranx_id": tranxId,
        "qty": qty,
        "order_uuid": orderUuid,
        "currency": currency,
        "id": id,
        "mode_of_payment": modeOfPayment,
      };
}
