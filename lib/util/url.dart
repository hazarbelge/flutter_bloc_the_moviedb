//import 'url_key_secret.dart';

class Url {
  //API key
  static const String apiKey = "YOUR.API_KEY";

  //Base URLs
  static const String movieDbBaseUrl = 'https://api.themoviedb.org/3';

  //Authentication URLs
  static const String sessionIdUrl = '$movieDbBaseUrl/authentication/guest_session/new?api_key=$apiKey';
  static String sessionId = '';

  //Background Images URLs
  static const String appLogoUrl = "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png";
  static const String backgroundUrl = "";

  //Movies URLs
  static const String latestMovie = '$movieDbBaseUrl/movie/latest?api_key=$apiKey';
  static const String nowPlayingMovies = '$movieDbBaseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies = '$movieDbBaseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies = '$movieDbBaseUrl/movie/top_rated?api_key=$apiKey';
  static const String upcomingMovies = '$movieDbBaseUrl/movie/upcoming?api_key=$apiKey';
  static String rateMovie(int movieId) => '$movieDbBaseUrl/movie/$movieId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //TVs URLs
  static const String latestTv = '$movieDbBaseUrl/tv/latest?api_key=$apiKey';
  static const String airingTodayTv = '$movieDbBaseUrl/tv/airing_today?api_key=$apiKey';
  static const String onTheAirTv = '$movieDbBaseUrl/tv/on_the_air?api_key=$apiKey';
  static const String popularTv = '$movieDbBaseUrl/tv/popular?api_key=$apiKey';
  static const String topRatedTv = '$movieDbBaseUrl/tv/top_rated?api_key=$apiKey';
  static String rateTV(int tvId) => '$movieDbBaseUrl/tv/$tvId/rating?api_key=$apiKey&guest_session_id=$sessionId';

  //About Me&App
  static const String authorProfile = 'https://www.linkedin.com/in/hazarbelge/';
  static const String emailUrl = 'mailto:hazarbelge@gmail.com?subject=About Flutter The Movie DB!';
  static const String appSource = 'https://github.com/hazarbelge/flutter_block_the_moviedb';
}
