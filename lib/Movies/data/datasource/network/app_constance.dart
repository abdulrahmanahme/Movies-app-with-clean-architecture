class ApiConstance {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=1d753db7ee9a0563a0f8a2d0989b6ab0&language=en-US&page=1
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String nowPlaying = '/movie/now_playing';
  static const String popularMovies = '/movie/popular';
  static const String topRated = '/movie/top_rated';
  static const String apiKey = '1d753db7ee9a0563a0f8a2d0989b6ab0';
  static const String getNowPlaying =
      '${ApiConstance.baseUrl}${ApiConstance.nowPlaying}?api_key=${ApiConstance.apiKey}';
  static const String getTopRated =
      '${ApiConstance.baseUrl}${ApiConstance.topRated}?api_key=${ApiConstance.apiKey}';
  static const String getPopular =
      '${ApiConstance.baseUrl}${ApiConstance.popularMovies}?api_key=${ApiConstance.apiKey}';
      static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
     static String getMovieId(int idMovie)=>'${ApiConstance.baseUrl}/movie/$idMovie?api_key=${ApiConstance.apiKey}';
     static String getRecommendMovieId(int idMovie)=>'${ApiConstance.baseUrl}/movie/$idMovie/recommendations?api_key=${ApiConstance.apiKey}';
      static imageUrl(String path)=>'$baseImageUrl$path';
}
