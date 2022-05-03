import 'package:app/data/helpers/date_helper.dart';
import 'package:app/presentation/screens/home/bloc/home_screen_bloc.dart';
import 'package:app/presentation/shared/app_const.dart';
import 'package:app/presentation/shared/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeContent extends StatelessWidget {
  final HomeScreenLoadedState state;

  const HomeContent(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: AppSizes.size20,
            ),
            ElevatedButton(
              onPressed: () => BlocProvider.of<HomeScreenBloc>(context).add(
                OnDetailFactsScreenRedirect(),
              ),
              child: Text(
                searchHistory.toUpperCase(),
              ),
            ),
            const SizedBox(
              height: AppSizes.size20,
            ),
            Image.network(
              state.photo.url != null ? '$catPhotoUrl/${state.photo.url}' : '',
            ),
            const SizedBox(
              height: AppSizes.size20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.size10,
              ),
              child: Text(
                state.fact.text ?? '',
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.size20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.size10,
              ),
              child: Text(
                transformationDate(
                  state.fact.createdAt,
                ),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.size20,
            ),
            ElevatedButton(
              onPressed: () => BlocProvider.of<HomeScreenBloc>(context).add(
                FactLoadEvent(),
              ),
              child: const Text(anotherFact),
            )
          ],
        ),
      ),
    );
  }
}
