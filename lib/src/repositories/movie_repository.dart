import 'package:flutter_architecture/src/apiprovs/movie_api_provider.dart';
import 'package:flutter_architecture/src/models/trailer_model.dart';
import '../models/item_model.dart';

class MovieRepository {
  final moviesProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => moviesProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => moviesProvider.fetchTrailers(movieId);
}
