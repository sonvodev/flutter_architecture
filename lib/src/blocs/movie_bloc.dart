import 'package:flutter_architecture/src/models/item_model.dart';
import 'package:flutter_architecture/src/repositories/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final _repository = MovieRepository();
  final _movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _movieFetcher.sink.add(itemModel);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final movieBloc = MovieBloc();
