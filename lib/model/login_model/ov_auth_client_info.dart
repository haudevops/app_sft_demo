
import 'package:sft_project/common/define_field.dart';

class OvAuthClientInfo {
  OvAuthClientInfo({
    this.fullName,
    this.email,
    this.displayName,
    this.phone,
  });

  factory OvAuthClientInfo.fromJson(Map<String, dynamic> map) {
    return OvAuthClientInfo(
      fullName: 'OVTeam', // map[FULL_NAME_FIELD],
      email: map[EMAIL_FIELD],
      displayName: 'OVTeam', // map[DISPLAY_NAME_FIELD],
      phone: map[PHONE_FIELD],
    );
  }

  String? fullName;
  String? email;
  String? displayName;
  String? phone;
}
