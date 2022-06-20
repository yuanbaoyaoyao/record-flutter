import '../constant/url_constant.dart';
import '../entities/announcement_entity.dart';
import '../utils/http_util.dart';

class AnnouncementAPI {
  static String request = '/announcementClient/';

  static Future listAnnouncementAPI() async {
    var response = await HttpUtil()
        .get(UrlConstant.debugClientIp + request + 'list');

    return AnnouncementEntity.fromJson(response);
  }
}
