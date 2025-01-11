import 'dart:async';
import 'dart:io';

import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flick_finder/common/helpers/data_state.dart';
import 'package:logger/logger.dart';

class HomeRemoteSource {
  final Logger logger;

  HomeRemoteSource({required this.logger});

  Future<DataState<List<Map<String, dynamic>>>> getSeries({
    required String category,
  }) async {
    try {
      logger.i('Fetching series from remote source ($category)...');

      final response = await http.get(
        Uri.parse('$baseUrl//search/shows?q=$category'),
      );

      if (response.statusCode != 200) {
        logger.e('Error fetching series from remote source: $response');
        return DataFailure(
            'Error fetching series from remote source: $response', -1);
      }

      if (response.body.isEmpty) {
        logger.e('No data found');
        return DataSuccess([], 'No data found');
      }

      final data = jsonDecode(response.body) as List<dynamic>;
      final dataItems =
          data.map((e) => e['show'] as Map<String, dynamic>).toList();

      logger.i('Data items ($category): ${dataItems.length}');

      return DataSuccess(dataItems, "Success");
    } catch (error) {
      if (error is SocketException || error is TimeoutException) {
        logger.e('Network error: $error');
        return DataFailure('Network error: $error', -1);
      } else {
        logger.e('Unknown error: $error');
        return DataFailure('Unknown error: $error', -1);
      }
    }
  }
}
