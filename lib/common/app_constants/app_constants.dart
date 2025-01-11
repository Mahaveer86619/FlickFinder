String prefUserKey = 'user';
String prefTokenKey = 'token';
String prefRefreshTokenKey = 'refresh_token';

String notificationChannelGroupKey = 'flick_finder_notification_channel_group';
String notificationChannelGroupName =
    'flick_finder_notification_channel_group_name';
String notificationChannelId = 'flick_finder_notification_channel';
String notificationChannelName = 'FlickFinder Notifications';
String notificationChannelDescription = 'Notifications for FlickFinder';

const String defaultAvatarUrl = 'https://feji.us/a593ri';
const String defaultGroupAvatarUrl = 'https://tinyurl.com/223bcs7k';

const String baseUrl = 'https://api.tvmaze.com';

enum SeriesCategory {
  all,
  scienceFiction,
  fantasy,
  mystery,
  romance,
  horror,
  thriller,
  historical,
  western,
  comedy,
  drama,
}

extension SeriesCategoryExtension on SeriesCategory {
  String get name {
    switch (this) {
      case SeriesCategory.all:
        return 'All';
      case SeriesCategory.scienceFiction:
        return 'Science Fiction';
      case SeriesCategory.fantasy:
        return 'Fantasy';
      case SeriesCategory.mystery:
        return 'Mystery';
      case SeriesCategory.romance:
        return 'Romance';
      case SeriesCategory.horror:
        return 'Horror';
      case SeriesCategory.thriller:
        return 'Thriller';
      case SeriesCategory.historical:
        return 'Historical';
      case SeriesCategory.western:
        return 'Western';
      case SeriesCategory.comedy:
        return 'Comedy';
      case SeriesCategory.drama:
        return 'Drama';
    }
  }
}

// String to SeriesCategory
extension StringExtension on String {
  SeriesCategory toSeriesCategory() {
    switch (this) {
      case 'All':
        return SeriesCategory.all;
      case 'Science Fiction':
        return SeriesCategory.scienceFiction;
      case 'Fantasy':
        return SeriesCategory.fantasy;
      case 'Mystery':
        return SeriesCategory.mystery;
      case 'Romance':
        return SeriesCategory.romance;
      case 'Horror':
        return SeriesCategory.horror;
      case 'Thriller':
        return SeriesCategory.thriller;
      case 'Historical':
        return SeriesCategory.historical;
      case 'Western':
        return SeriesCategory.western;
      case 'Comedy':
        return SeriesCategory.comedy;
      case 'Drama':
        return SeriesCategory.drama;
      default:
        return SeriesCategory.all; // default to all
    }
  }
}
