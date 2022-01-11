import 'dart:convert';

HomeResponce homeResponceFromJson(String str) =>
    HomeResponce.fromJson(json.decode(str));

String homeResponceToJson(HomeResponce data) => json.encode(data.toJson());

class HomeResponce {
  HomeResponce({
    this.responseCode,
    this.responseMessage,
    this.result,
  });

  int? responseCode;
  String? responseMessage;
  Result? result;

  factory HomeResponce.fromJson(Map<String, dynamic> json) => HomeResponce(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.table,
    required this.table1,
    required this.table2,
  });

  List<Table0> table;
  List<Table1> table1;
  List<Table2> table2;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        table: List<Table0>.from(json["Table"].map((x) => Table0.fromJson(x))),
        table1:
            List<Table1>.from(json["Table1"].map((x) => Table1.fromJson(x))),
        table2:
            List<Table2>.from(json["Table2"].map((x) => Table2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": List<dynamic>.from(table.map((x) => x.toJson())),
        "Table1": List<dynamic>.from(table1.map((x) => x.toJson())),
        "Table2": List<dynamic>.from(table2.map((x) => x.toJson())),
      };
}

class Table0 {
  Table0({
    required this.totkenVerifyStatus,
    required this.verifyMessage,
  });

  bool totkenVerifyStatus;
  String verifyMessage;

  factory Table0.fromJson(Map<String, dynamic> json) => Table0(
        totkenVerifyStatus: json["TotkenVerifyStatus"],
        verifyMessage: json["VerifyMessage"],
      );

  Map<String, dynamic> toJson() => {
        "TotkenVerifyStatus": totkenVerifyStatus,
        "VerifyMessage": verifyMessage,
      };
}

class Table1 {
  Table1({
    required this.entityId,
    required this.entityName,
    required this.lastUpdatedDateTime,
  });

  int entityId;
  String entityName;
  DateTime lastUpdatedDateTime;

  factory Table1.fromJson(Map<String, dynamic> json) => Table1(
        entityId: json["EntityId"],
        entityName: json["EntityName"],
        lastUpdatedDateTime: DateTime.parse(json["LastUpdatedDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "EntityId": entityId,
        "EntityName": entityName,
        "LastUpdatedDateTime": lastUpdatedDateTime.toIso8601String(),
      };
}

class Table2 {
  Table2({
    required this.customerId,
    required this.customerCode,
    required this.customerMobileNumber,
    required this.customerName,
    required this.exportCustomer,
    required this.emirateId,
    required this.routeId,
    required this.creditCustomer,
    required this.creditLimit,
    required this.focApproved,
    required this.activeStatus,
  });

  int customerId;
  String customerCode;
  String customerMobileNumber;
  String customerName;
  bool exportCustomer;
  int emirateId;
  int routeId;
  bool creditCustomer;
  double creditLimit;
  bool focApproved;
  bool activeStatus;

  factory Table2.fromJson(Map<String, dynamic> json) => Table2(
        customerId: json["CustomerId"],
        customerCode: json["CustomerCode"],
        customerMobileNumber: json["CustomerMobileNumber"],
        customerName: json["CustomerName"],
        exportCustomer: json["ExportCustomer"],
        emirateId: json["EmirateId"],
        routeId: json["RouteId"],
        creditCustomer: json["CreditCustomer"],
        creditLimit: json["CreditLimit"],
        focApproved: json["FOCApproved"] != null ? json["FOCApproved"] : false,
        activeStatus: json["ActiveStatus"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerId": customerId,
        "CustomerCode": customerCode,
        "CustomerMobileNumber": customerMobileNumber,
        "CustomerName": customerName,
        "ExportCustomer": exportCustomer,
        "EmirateId": emirateId,
        "RouteId": routeId,
        "CreditCustomer": creditCustomer,
        "CreditLimit": creditLimit,
        "FOCApproved": focApproved,
        "ActiveStatus": activeStatus,
      };
}
