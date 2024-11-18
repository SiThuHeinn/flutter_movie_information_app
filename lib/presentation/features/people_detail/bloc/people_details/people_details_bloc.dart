import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/PeopleDetails.dart';
import '../../../../../domain/usecases/get_people_details.dart';

part 'people_details_event.dart';
part 'people_details_state.dart';

class PeopleDetailsBloc extends Bloc<PeopleDetailsEvent, PeopleDetailsState> {
  final GetPeopleDetails getPeopleDetails;

  PeopleDetailsBloc({required this.getPeopleDetails}) : super(PeopleDetailsInitial()) {


    on<GetPeopleDetailsEvent>((event, emit) async {
      emit(PeopleDetailsLoading());
      final result = await getPeopleDetails(event.id);
      result.fold(
        (failure) => emit(PeopleDetailsError(failure.message)),
        (peopleDetails) => emit(PeopleDetailsLoaded(peopleDetails)),
      );

    });
  }
}
