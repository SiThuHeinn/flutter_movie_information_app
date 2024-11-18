part of 'people_details_bloc.dart';

@immutable
sealed class PeopleDetailsEvent {}

class GetPeopleDetailsEvent extends PeopleDetailsEvent {
  final int id;

  GetPeopleDetailsEvent(this.id);
}

