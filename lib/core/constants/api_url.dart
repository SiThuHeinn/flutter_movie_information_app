

class ApiUrl {
  static const apiKey = "dc6f6d4cc6c09db8ca384d0d85b538cd";
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageBasePath = "https://image.tmdb.org/t/p/original";
  static const profileBasePath = "https://image.tmdb.org/t/p/original";
  static const trailerBasePath = "https://www.youtube.com/watch?v=";
  static const errorImagePath = "https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png";

  // Movies
  static const nowPlayingMovies = "$baseUrl/movie/now_playing";
  static const popularMovies = "$baseUrl/movie/popular";
  static const trendingMovies = "$baseUrl/trending/movie/week";
  static const upcomingMovies = "$baseUrl/movie/upcoming";
  static const searchMovies = "$baseUrl/search/movie";
  static const recommendations = "$baseUrl/movie/";
  static const movieDetail = "$baseUrl/movie";
  static const topRatedMovies = "$baseUrl/movie/top_rated";


  // TV Shows
  static const searchTvShows = "$baseUrl/search/tv";
  static const tvShowDetail = "$baseUrl/tv";
  static const trendingTvShows = "$baseUrl/trending/tv/week";
  static const topRatedTvShows = "$baseUrl/tv/top_rated";

  // People
  static const popularPeople = "$baseUrl/person/popular";
  static const searchPeople = "$baseUrl/search/person";
  static const personDetail = "$baseUrl/person";

}

