// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DisplayProfileResponse _$$_DisplayProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DisplayProfileResponse(
      userID: json['User_ID'] as String?,
      companyID: json['Company_ID'] as int?,
      ownerId: json['owner_id'] as int?,
      userGroupID: json['User_Group_ID'] as int?,
      superAdmin: json['super_admin'] as int?,
      level2Admin: json['level_2_admin'] as int?,
      onesignalPlayerId: json['onesignal_player_id'] as String?,
      userFirstName: json['User_first_name'] as String?,
      userLastName: json['User_last_name'] as String?,
      userEmailAddress: json['User_email_address'] as String?,
      userContactCountryCode: json['User_contact_country_code'] as String?,
      userContactCountryNo: json['User_contact_contactNo'] as String?,
      userRoleDescription: json['User_role_description'] as String?,
      userStatus: json['User_Status'] as String?,
      noOfPassswordRetries: json['No_Of_Passsword_Retries'] as int?,
      lastChangedPasswordDateTime:
          json['Last_Changed_Password_DateTime'] as String?,
      currentPassword: json['Current_Password'] as String?,
      profilePhotoPath: json['profile_photo_path'] as String?,
      profilePhotoName: json['profile_photo_name'] as String?,
      profilePhotoDirectory: json['profile_photo_directory'] as String?,
      lastSignOnDateTime: json['Last_SignOn_DateTime'] as String?,
      lastSignOutDateTime: json['Last_SignOut_DateTime'] as String?,
      firstLogin: json['First_Login'] as int?,
      recCreateDatetime: json['REC_create_datetime'] as String?,
      recLastUpdateDatetime: json['REC_lastUpdate_datetime'] as String?,
      recLastUpdateBy: json['REC_lastUpdate_by'] as String?,
      recStatus: json['REC_status'] as int?,
      headerToken: json['Header_Token'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_DisplayProfileResponseToJson(
        _$_DisplayProfileResponse instance) =>
    <String, dynamic>{
      'User_ID': instance.userID,
      'Company_ID': instance.companyID,
      'owner_id': instance.ownerId,
      'User_Group_ID': instance.userGroupID,
      'super_admin': instance.superAdmin,
      'level_2_admin': instance.level2Admin,
      'onesignal_player_id': instance.onesignalPlayerId,
      'User_first_name': instance.userFirstName,
      'User_last_name': instance.userLastName,
      'User_email_address': instance.userEmailAddress,
      'User_contact_country_code': instance.userContactCountryCode,
      'User_contact_contactNo': instance.userContactCountryNo,
      'User_role_description': instance.userRoleDescription,
      'User_Status': instance.userStatus,
      'No_Of_Passsword_Retries': instance.noOfPassswordRetries,
      'Last_Changed_Password_DateTime': instance.lastChangedPasswordDateTime,
      'Current_Password': instance.currentPassword,
      'profile_photo_path': instance.profilePhotoPath,
      'profile_photo_name': instance.profilePhotoName,
      'profile_photo_directory': instance.profilePhotoDirectory,
      'Last_SignOn_DateTime': instance.lastSignOnDateTime,
      'Last_SignOut_DateTime': instance.lastSignOutDateTime,
      'First_Login': instance.firstLogin,
      'REC_create_datetime': instance.recCreateDatetime,
      'REC_lastUpdate_datetime': instance.recLastUpdateDatetime,
      'REC_lastUpdate_by': instance.recLastUpdateBy,
      'REC_status': instance.recStatus,
      'Header_Token': instance.headerToken,
      'id': instance.id,
    };
