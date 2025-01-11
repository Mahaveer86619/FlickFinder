import 'dart:developer';

import 'package:flick_finder/common/app_constants/app_constants.dart';
import 'package:flick_finder/features/home/domain/entities/series_entity.dart';

class SeriesModel extends SeriesEntity {
  SeriesModel({
    required super.id,
    required super.name,
    required super.type,
    required super.language,
    required super.status,
    required super.averageRuntime,
    required super.officialSite,
    required super.rating,
    required super.image,
    required super.summary,
    required super.category,
  });

  /// Factory to create `SeriesModel` from JSON
  factory SeriesModel.fromJson(
    Map<String, dynamic> json,
    SeriesCategory category,
  ) {
    return SeriesModel(
      id: json['id'] ?? '~error~',
      name: json['name'] ?? '~error~',
      type: json['type'] ?? '~error~',
      language: json['language'] ?? '~error~',
      status: json['status'] ?? '~error~',
      averageRuntime: json['averageRuntime'] ?? 0,
      officialSite: json['officialSite'] ?? '~error~',
      rating: json['rating']['average']?.toString() ?? 'N/A',
      image: json['image']?['original'] ?? '~error~',
      summary: json['summary'] ?? '',
      category: category,
    );
  }

  /// Method to convert `SeriesModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'language': language,
      'status': status,
      'averageRuntime': averageRuntime,
      'officialSite': officialSite,
      'rating': rating,
      'image': image,
      'summary': summary,
      'categories': category.name,
    };
  }

  /// To entity
  SeriesEntity toEntity() {
    return SeriesEntity(
      id: id,
      name: name,
      type: type,
      language: language,
      status: status,
      averageRuntime: averageRuntime,
      officialSite: officialSite,
      rating: rating,
      image: image,
      summary: summary,
      category: category,
    );
  }
}
