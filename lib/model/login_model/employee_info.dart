
class EmployeeInfoModel {
  EmployeeInfoModel({
    // this.id,
    this.fullName,
    // this.email,
    // this.displayName,
    // this.phone,
    // this.warehouseId,
    // this.warehouse,
    // this.internalToken,
    this.functions,
    this.clientCode
  });

  factory EmployeeInfoModel.fromJson(Map<String, dynamic> map) {
    return EmployeeInfoModel(
      // id: map['Id'],
      fullName: map['FullName'],
      // email: map['Email'],
      // displayName: map['DisplayName'],
      // phone: map['Phone'],
      // warehouseId: map['WarehouseId'],
      // warehouse: map['Warehouse'],
      // internalToken: map['InternalToken'],
      functions: List.from(map['Functions']),
      clientCode: map['ClientCode']
    );
  }

  // String id;
  String? fullName;
  // String email;
  // String displayName;
  // String phone;
  // int warehouseId;
  // String warehouse;
  // String internalToken;
  List<String>? functions;
  String? clientCode;
}
