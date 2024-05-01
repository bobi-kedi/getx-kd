import 'package:flutter/material.dart';
import 'package:kelasdigital/configs/constant/api_config.dart';
import 'package:kelasdigital/helpers/models/entity_profile.dart';
import 'package:kelasdigital/helpers/services/api_service.dart';

import '../services/local/profile_storage_service.dart';

class AccountProvider {
  static Future<BaseResponse> profile() async {
    return await ApiService.to.get(ApiConfig.PROFILE, (res) async {
      if (res['data'] != null) {
        try {
          var user = res['data']['user'];
          var basicInfo = res['data']['basicInformationProfile'];
          var profile = EntityProfile(
            id: user['id'],
            uuid: user['uuid'],
            email: user['email'],
            fullname: user['fullName'],
            username: user['username'],
            isVerifiedAccount: user['isVerifiedAccount'],
            linkedWithGoogle: user['linkedWithGoogle'],
            googleEmail: user['googleEmail'],
            phone: user['phone'],
            passportNo: basicInfo['passportNo'],
            residentNo: basicInfo['residentNo'],
            photo: basicInfo['photo'],
            userType:
                basicInfo['userType']['description'].toString().toLowerCase(),
          );

          StorageService.to.saveToDb(profile);

          return BaseResponse(
            ResponseStatus.success,
            'Profile Success',
            code: res['meta']['status_code'].toString(),
            data: profile.toJson(),
          );
        } catch (e) {
          debugPrint('ERROR ${e.toString()}');
          return BaseResponse(ResponseStatus.failed, e.toString());
        }
      } else {
        return BaseResponse(ResponseStatus.failed, res['meta']['message']);
      }
    }, withToken: true);
  }
}
