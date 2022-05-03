import 'package:app/presentation/screens/home/bloc/home_screen_bloc.dart';
import 'package:app/presentation/shared/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => BlocProvider.of<HomeScreenBloc>(context).add(
          FactLoadEvent(),
        ),
        child: Text(
          retry.toUpperCase(),
        ),
      ),
    );
  }
}
