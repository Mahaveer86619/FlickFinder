import 'package:flick_finder/common/app_constants/app_constants.dart';

class SeriesEntity {
  final int id;
  final String name;
  final String type;
  final String language;
  final String status;
  final int averageRuntime;
  final String officialSite;
  final String rating;
  final String image;
  final String summary;
  final SeriesCategory category;

  const SeriesEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.language,
    required this.status,
    required this.averageRuntime,
    required this.officialSite,
    required this.rating,
    required this.image,
    required this.summary,
    required this.category,
  });

  // To string
  @override
  String toString() {
    return '''SeriesEntity{
    id: $id
    name: $name
    type: $type
    language: $language
    status: $status
    averageRuntime: $averageRuntime
    officialSite: $officialSite
    rating: $rating
    image: $image
    summary: $summary
    category: $category
    }''';
  }
}
