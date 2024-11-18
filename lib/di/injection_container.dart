import 'package:get_it/get_it.dart';
import 'package:movie_info/core/network/dio_client.dart';
import 'package:movie_info/data/datasources/movie_remote_data_source.dart';
import 'package:movie_info/data/datasources/movie_remote_data_source_impl.dart';
import 'package:movie_info/domain/repository/movie_repository.dart';
import 'package:movie_info/domain/usecases/get_movie_reviews.dart';
import 'package:movie_info/domain/usecases/get_popular_movies.dart';
import 'package:movie_info/presentation/features/movie_detail/bloc/reviews/movie_reviews_bloc.dart';
import 'package:movie_info/presentation/features/movie_detail/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:movie_info/presentation/features/people/bloc/popular_people_bloc.dart';
import 'package:movie_info/presentation/features/search/bloc/search_option/search_option_cubit.dart';
import 'package:movie_info/presentation/features/top_rated/bloc/movies/top_rated_movies_bloc.dart';
import 'package:movie_info/presentation/features/tv_show_detail/bloc/tv_show_details_bloc.dart';
import '../data/repository/movie_repopsitory_impl.dart';
import '../domain/usecases/get_movie_genres.dart';
import '../domain/usecases/get_movie_trailers.dart';
import '../domain/usecases/get_people_details.dart';
import '../domain/usecases/get_popular_people.dart';
import '../domain/usecases/get_profile_images.dart';
import '../domain/usecases/get_recommended_movies.dart';
import '../domain/usecases/get_similar_movies.dart';
import '../domain/usecases/get_top_rated_movies.dart';
import '../domain/usecases/get_top_rated_tv_shows.dart';
import '../domain/usecases/get_trending_movies.dart';
import '../domain/usecases/get_trending_tv_shows.dart';
import '../domain/usecases/get_tv_show_details.dart';
import '../domain/usecases/get_upcoming_movies.dart';
import '../domain/usecases/search_movie.dart';
import 'package:http/http.dart' as http;
import '../domain/usecases/search_tv_shows.dart';
import '../presentation/features/home/bloc/popular_movie/popular_movie_bloc.dart';
import '../presentation/features/home/bloc/trending_movie/trending_movie_bloc.dart';
import '../presentation/features/home/bloc/trending_tv_shows/trending_tv_shows_bloc.dart';
import '../presentation/features/home/bloc/upcoming_movie/upcoming_movie_bloc.dart';
import '../presentation/features/movie_detail/bloc/genres/movie_genres_bloc.dart';
import '../presentation/features/movie_detail/bloc/recommendations/recommended_movies_bloc.dart';
import '../presentation/features/movie_detail/bloc/trailer/movie_trailer_bloc.dart';
import '../presentation/features/people_detail/bloc/people_details/people_details_bloc.dart';
import '../presentation/features/people_detail/bloc/profile_images_bloc.dart';
import '../presentation/features/search/bloc/search/search_bloc.dart';
import '../presentation/features/top_rated/bloc/top_rated_selection_cubit.dart';
import '../presentation/features/top_rated/bloc/tv_shows/top_rated_tv_shows_bloc.dart';



final getIt = GetIt.instance;

void initGetIt() {
  // Bloc
  getIt.registerFactory(() => PopularMovieBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMovieBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchBloc(getSearchMovies: getIt(), getSearchTvShows: getIt()));
  getIt.registerFactory(() => UpcomingMovieBloc(getUpComingMovies: getIt()));
  getIt.registerFactory(() => MovieTrailerBloc(getMovieTrailers: getIt()));
  getIt.registerFactory(() => RecommendedMoviesBloc(getRecommendedMovies: getIt()));
  getIt.registerFactory(() => MovieReviewsBloc(getMovieReviews: getIt()));
  getIt.registerFactory(() => MovieGenresBloc(getMovieGenres: getIt()));
  getIt.registerFactory(() => SearchOptionCubit());
  getIt.registerFactory(() => TvShowDetailsBloc(getTvShowDetails: getIt()));
  getIt.registerFactory(() => PopularPeopleBloc(getPopularPeople: getIt()));
  getIt.registerFactory(() => ProfileImagesBloc(getProfileImages: getIt()));
  getIt.registerFactory(() => PeopleDetailsBloc(getPeopleDetails: getIt()));
  getIt.registerFactory(() => TrendingTvShowsBloc(getTrendingTvShows: getIt()));
  getIt.registerFactory(() => TopRatedSelectionCubit());
  getIt.registerFactory(() => TopRatedMoviesBloc(getTopRatedMovies: getIt()));
  getIt.registerFactory(() => TopRatedTvShowsBloc(getTopRatedTvShows: getIt()));
  getIt.registerFactory(() => SimilarMoviesBloc(getSimilarMovies: getIt()));


  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovie(getIt()));
  getIt.registerLazySingleton(() => GetUpcomingMovies(getIt()));
  getIt.registerLazySingleton(() => GetMovieTrailers(getIt()));
  getIt.registerLazySingleton(() => GetRecommendedMovies(getIt()));
  getIt.registerLazySingleton(() => GetMovieReviews(getIt()));
  getIt.registerLazySingleton(() => GetMovieGenres(getIt()));
  getIt.registerLazySingleton(() => SearchTvShows(getIt()));
  getIt.registerLazySingleton(() => GetTvShowDetails(getIt()));
  getIt.registerLazySingleton(() => GetPopularPeople(getIt()));
  getIt.registerLazySingleton(() => GetProfileImages(getIt()));
  getIt.registerLazySingleton(() => GetPeopleDetails(getIt()));
  getIt.registerLazySingleton(() => GetTrendingTvShows(getIt()));
  getIt.registerLazySingleton(() => GetTopRatedMovies(getIt()));
  getIt.registerLazySingleton(() => GetTopRatedTvShows(getIt()));
  getIt.registerLazySingleton(() => GetSimilarMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDateSource: getIt()));


  // Data sources
  getIt.registerLazySingleton<MovieRemoteDateSource>(() => MovieRemoteDataSourceImpl(client: getIt(), dioClient: getIt()));


  // Http Service
  getIt.registerLazySingleton(() => http.Client());

  // Dio Service
  getIt.registerSingleton<DioClient>(DioClient());

}