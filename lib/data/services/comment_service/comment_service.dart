import 'dart:developer';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';
import '../../../shared/helper_functions/future_try_catch_helper/future_try_catch_helper.dart';

class OstrumCommentService {
  final ApiClient _apiClient;

  OstrumCommentService(this._apiClient);

  Future<List<Map<String, dynamic>>> fetchCommentsRaw() async {
    List<Map<String, dynamic>> result = [];

    await futureTryCatch(
      () async {
        final headers = {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.9',
          'Connection': 'keep-alive',
          'Upgrade-Insecure-Requests': '1',
        };

        final response = await _apiClient.get(ApiConstants.comments, headers: headers);

        final dynamic raw = response['data'] ?? response;
        final List<dynamic> data = raw is List ? raw : [];

        result = data.map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e)).toList();
      },
      onError: (error) {
        log('fetchCommentsRaw error: ${error.message}');
      },
    );

    return result;
  }
}
