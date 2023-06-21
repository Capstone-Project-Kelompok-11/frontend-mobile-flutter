import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/Services/edit_profile_service.dart';
import 'package:lms_apps/utils/shared_pref.dart';
import 'package:mime/mime.dart';

class ChangeImageProfileService {
  Future<bool> changeImage() async {
    final token = await SharedPref.getToken();
    var dio = Dio();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      var resolver = MimeTypeResolver();

      if (result != null) {
        File file = File(result.files.single.path ?? " ");
        var mediaType = MediaType.parse(
            resolver.lookup(file.path) ?? "application/octet-stream");
        var n = file.lengthSync();
        var mFile = MultipartFile(file.openRead(0, n), n,
            filename: 'data', contentType: mediaType);

        var form = FormData();

        form.files.add(MapEntry("draw", mFile));

        final response = await dio.post(
          '${APIConstant.url}/users/profile/image/upload',
          data: form,
          options: Options(headers: APIConstant.auth('$token')),
        );
        if (response.statusCode == 200) {
          EditProfileService().getUserInfo;
          return true;
        }
      } else {
        print('Result is null');
        return false;
      }
      return true;
    } on DioError catch (e) {
      e.message;
      return false;
    }
  }
}
