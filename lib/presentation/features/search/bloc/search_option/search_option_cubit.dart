import 'package:bloc/bloc.dart';


enum SearchOptionType { movie, tvShow }

class SearchOptionCubit extends Cubit<SearchOptionType> {

  SearchOptionCubit() : super(SearchOptionType.movie);

  void onSelectMovie() => emit(SearchOptionType.movie);
  void onSelectTvShow() => emit(SearchOptionType.tvShow);


}
