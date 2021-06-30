class Url {
  //API key
  static const apiKey = '9c1cc02e925dc88e8866b2c222aa95f9';

  //Base URLs
  static const movieDbBaseUrl = 'https://api.themoviedb.org/3';

  //Authentication URLs
  static const sessionIdUrl = '$movieDbBaseUrl/authentication/guest_session/new?api_key=$apiKey';
  static String sessionId = '';

  //Background Images URLs
  static const appLogoUrl = "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png";
  static const backgroundUrl = "";

  //Movies URLs
  static const latestMovie = '$movieDbBaseUrl/movie/latest?api_key=$apiKey';
  static const nowPlayingMovies = '$movieDbBaseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMovies = '$movieDbBaseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMovies = '$movieDbBaseUrl/movie/top_rated?api_key=$apiKey';
  static const upcomingMovies = '$movieDbBaseUrl/movie/upcoming?api_key=$apiKey';
  static String rateMovie(int movieId) => '$movieDbBaseUrl/movie/$movieId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //TVs URLs
  static const latestTv = '$movieDbBaseUrl/tv/latest?api_key=$apiKey';
  static const airingTodayTv = '$movieDbBaseUrl/tv/airing_today?api_key=$apiKey';
  static const onTheAirTv = '$movieDbBaseUrl/tv/on_the_air?api_key=$apiKey';
  static const popularTv = '$movieDbBaseUrl/tv/popular?api_key=$apiKey';
  static const topRatedTv = '$movieDbBaseUrl/tv/top_rated?api_key=$apiKey';
  static String rateTV(int tvId) => '$movieDbBaseUrl/tv/$tvId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //About Me&App
  static const authorProfile = 'https://www.linkedin.com/in/hazarbelge/';
  static const emailUrl = 'mailto:hazarbelge@gmail.com?subject=About Flutter The Movie DB!';
  static const appSource = 'https://github.com/hazarbelge/Flutter-Bloc-TheMovieDB';
}
