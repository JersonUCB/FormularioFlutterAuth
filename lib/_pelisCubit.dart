import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_form_wpp/movie.dart';

class PelisCubit extends Cubit<List<Movie>> {
  PelisCubit() : super([]);

  Future<void> fetchPopularMovies() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3',
      );

      if (response.statusCode == 200) {
        final List<Movie> movies = movieFromJson(response.data) as List<Movie>;
        emit(movies);
      } else {
        emit([]);
      }
    } catch (e) {
      emit([]);
    }
  }
}