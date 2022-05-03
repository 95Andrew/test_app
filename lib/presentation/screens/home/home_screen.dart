import 'package:app/presentation/screens/home/widgets/error_content.dart';
import 'package:app/presentation/screens/home/widgets/home_content.dart';
import 'package:app/presentation/shared/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_screen_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  bool isBuildState(HomeScreenState state) {
    return state is HomeScreenLoadingState || state is HomeScreenLoadedState || state is HomeScreenErrorState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          listenWhen: (previous, current) => !isBuildState(current),
          buildWhen: (previous, current) => isBuildState(current),
          builder: (context, state) {
            if (state is HomeScreenLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeScreenLoadedState) {
              return HomeContent(state);
            }
            if (state is HomeScreenErrorState) {
              return const ErrorContent();
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is RedirectToDetailFactsScreenState) {
              Navigator.pushNamed(
                context,
                AppScreens.detailFactsScreen,
                arguments: state.detailFactsList,
              );
            }
          },
        ),
      ),
    );
  }
}
