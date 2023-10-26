
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_wpp/_pelisCubit.dart';
import 'package:flutter_form_wpp/movie.dart';


class PelisScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PelisCubit, List<Movie>>(
      builder: (context, movies) {
        if (movies.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.results[0].title),
                subtitle: Text(movie.results[0].overview),
              );
            },
          );
        }
      },
    );
  }
}
