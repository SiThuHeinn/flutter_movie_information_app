import 'package:flutter_bloc/flutter_bloc.dart';

enum TopRatedSelectionType { movie, tvShow }

class TopRatedSelectionCubit extends Cubit<TopRatedSelectionType> {

  TopRatedSelectionCubit() : super(TopRatedSelectionType.movie);

  void onSelectMovie() => emit(TopRatedSelectionType.movie);
  void onSelectTvShow() => emit(TopRatedSelectionType.tvShow);


}
