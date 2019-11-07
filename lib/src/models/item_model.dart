class ItemModel {
  int _page;
  int _total_pages;
  int _total_results;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    final resultLength = parsedJson['results'].length;
    print(resultLength);

    _page = parsedJson['page'];
    _total_pages = parsedJson['total_pages'];
    _total_results = parsedJson['total_results'];

    List<_Result> temp = [];
    for (var i = 0; i < resultLength; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
     _results = temp;
  }
 List<_Result> get results => _results;
  int get total_pages => _total_pages;
  int get total_result => _total_results;
  int get page => _page;
}

class _Result {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;

  _Result(result){
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'].toDouble();
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  int get vote_count => _vote_count;
  int get id => _id;
  bool get video => _video;
  double get vote_average => _vote_average;
  String get title => _title;
  double get popularity => _popularity;
  String get poster_path => _poster_path;
  String get original_language => _original_language;
  String get original_title => _original_title;
  List<int> get genre_ids => _genre_ids;
  String get backdrop_path => _backdrop_path;
  bool get adult => _adult;
  String get overview => _overview;
  String get release_date =>_release_date;

}
