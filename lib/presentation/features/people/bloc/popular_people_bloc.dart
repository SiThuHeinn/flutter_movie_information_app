import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/People.dart';
import '../../../../domain/usecases/get_popular_people.dart';

part 'popular_people_event.dart';

part 'popular_people_state.dart';

class PopularPeopleBloc extends Bloc<PopularPeopleEvent, PopularPeopleState> {
  final GetPopularPeople getPopularPeople;

  final ScrollController scrollController = ScrollController();

  PopularPeopleBloc({required this.getPopularPeople})
      : super(PopularPeopleState.init()) {
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        debugPrint('on pagination: Page = ${state.page}');
        debugPrint('on pagination: Previous = ${state.people.map((e) => e.name)}');
        debugPrint('on pagination: Size = ${state.people.length}');
        add(GetPopularPeopleEvent(page: state.page + 1));
      }
    });

    on<GetPopularPeopleEvent>((event, emit) async {
      emit(state.copyWith(state: Status.loading));
      if (state.page > state.totalPages) {
        emit(state.copyWith(state: Status.endOfList));
      } else {
        final result = await getPopularPeople(event.page);
        result.fold((failure) {
          emit(state.copyWith(state: Status.error, message: failure.message));
        }, (peopleBundle) {
          final updatedPeople = [...state.people, ...peopleBundle.results];
          emit(state.copyWith(
            state: Status.loaded,
            people: updatedPeople,
            page: peopleBundle.page,
            totalPages: peopleBundle.totalPages,
          ));
        });
      }
    });
  }
}
