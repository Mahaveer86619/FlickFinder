import 'package:flick_finder/common/app_routes/app_routes.dart';
import 'package:flick_finder/core/services/notifications.dart';
import 'package:flick_finder/core/theme/app_theme.dart';
import 'package:flick_finder/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: '.env');

  await di.registerDependencies();
  await setupNotificationChannels();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Podcast',
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<UploadContentBloc>(
    //       create: (context) => di.sl<UploadContentBloc>(),
    //     ),
    //     BlocProvider<PodcastBloc>(
    //       create: (context) => di.sl<PodcastBloc>(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     title: 'AI Podcast',
    //     theme: lightMode,
    //     darkTheme: darkMode,
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: '/',
    //     routes: routes,
    //   ),
    // );
  }
}
