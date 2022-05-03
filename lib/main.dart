import 'package:app/presentation/screens/detailFactsScreen/detail_facts_screen.dart';
import 'package:app/presentation/screens/home/home_screen.dart';
import 'package:app/presentation/screens/home/bloc/home_screen_bloc.dart';
import 'package:app/presentation/shared/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/services/api_services.dart';
import 'data/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (BuildContext context) => ApiService(),
          ),
          RepositoryProvider(
            create: (BuildContext context) => HiveService(),
          ),
        ],
        child: BlocProvider(
          create: (BuildContext context) => HomeScreenBloc(
            RepositoryProvider.of<ApiService>(context),
            RepositoryProvider.of<HiveService>(context),
          )..add(
              FactLoadEvent(),
            ),
          child: const HomeScreen(),
        ),
      ),
      onGenerateRoute: (RouteSettings routeSettings) {
        final arguments = routeSettings.arguments;
        switch (routeSettings.name) {
          case AppScreens.detailFactsScreen:
            return createDetailFactsScreenRoute(arguments);
        }
      },
    );
  }

  MaterialPageRoute createDetailFactsScreenRoute(arguments) {
    return MaterialPageRoute(
      builder: (context) {
        return DetailFactsScreen(
          listDetailFacts: arguments,
        );
      },
    );
  }
}
