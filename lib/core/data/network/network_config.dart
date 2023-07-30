import 'package:food/UI/shared/utils.dart';
import 'package:food/core/data/repositories/shared_preference_repository.dart';
import 'package:food/core/enums/request_type.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';

  static String getFulApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool isMultipartRequest = false,
      bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type != RequestType.GET && isMultipartRequest == false)
        'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}
