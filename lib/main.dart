import 'package:flick_finder/common/app_routes/app_routes.dart';
import 'package:flick_finder/common/widgets/bottom_app_bar/bloc/navigation_bloc.dart';
import 'package:flick_finder/core/services/notifications.dart';
import 'package:flick_finder/core/theme/app_theme.dart';
import 'package:flick_finder/features/home/presentation/bloc/home_bloc.dart';
import 'package:flick_finder/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => di.sl<NavigationBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => di.sl<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'FlickFinder',
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
