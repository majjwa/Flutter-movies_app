import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return MovieBloc()..add(GetNowPlayingEvents());
    },
        child: BlocBuilder<MovieBloc, MoviesState>(
            builder: (context, state) {

      return const Scaffold();
    }));
  }
}
