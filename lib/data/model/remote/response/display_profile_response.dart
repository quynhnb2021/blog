// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'display_profile_response.freezed.dart';

part 'display_profile_response.g.dart';

@freezed
class DisplayProfileResponse with _$DisplayProfileResponse {
  const factory DisplayProfileResponse({
    @JsonKey(name: 'User_ID') String? userID,
    @JsonKey(name: 'Company_ID') int? companyID,
    @JsonKey(name: 'owner_id') int? ownerId,
    @JsonKey(name: 'User_Group_ID') int? userGroupID,
    @JsonKey(name: 'super_admin') int? superAdmin,
    @JsonKey(name: 'level_2_admin') int? level2Admin,
    @JsonKey(name: 'onesignal_player_id') String? onesignalPlayerId,
    @JsonKey(name: 'User_first_name') String? userFirstName,
    @JsonKey(name: 'User_last_name') String? userLastName,
    @JsonKey(name: 'User_email_address') String? userEmailAddress,
    @JsonKey(name: 'User_contact_country_code') String? userContactCountryCode,
    @JsonKey(name: 'User_contact_contactNo') String? userContactCountryNo,
    @JsonKey(name: 'User_role_description') String? userRoleDescription,
    @JsonKey(name: 'User_Status') String? userStatus,
    @JsonKey(name: 'No_Of_Passsword_Retries') int? noOfPassswordRetries,
    @JsonKey(name: 'Last_Changed_Password_DateTime')
        String? lastChangedPasswordDateTime,
    @JsonKey(name: 'Current_Password') String? currentPassword,
    @JsonKey(name: 'profile_photo_path') String? profilePhotoPath,
    @JsonKey(name: 'profile_photo_name') String? profilePhotoName,
    @JsonKey(name: 'profile_photo_directory') String? profilePhotoDirectory,
    @JsonKey(name: 'Last_SignOn_DateTime') String? lastSignOnDateTime,
    @JsonKey(name: 'Last_SignOut_DateTime') String? lastSignOutDateTime,
    @JsonKey(name: 'First_Login') int? firstLogin,
    @JsonKey(name: 'REC_create_datetime') String? recCreateDatetime,
    @JsonKey(name: 'REC_lastUpdate_datetime') String? recLastUpdateDatetime,
    @JsonKey(name: 'REC_lastUpdate_by') String? recLastUpdateBy,
    @JsonKey(name: 'REC_status') int? recStatus,
    @JsonKey(name: 'Header_Token') String? headerToken,
    @JsonKey(name: 'id') int? id,
  }) = _DisplayProfileResponse;

  factory DisplayProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DisplayProfileResponseFromJson(json);
}
