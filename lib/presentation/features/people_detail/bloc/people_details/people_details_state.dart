part of 'people_details_bloc.dart';

@immutable
sealed class PeopleDetailsState {}

final class PeopleDetailsInitial extends PeopleDetailsState {}

final class PeopleDetailsLoading extends PeopleDetailsState {}

final class PeopleDetailsLoaded extends PeopleDetailsState {
  final PeopleDetails details;

  PeopleDetailsLoaded(this.details);
}

final class PeopleDetailsError extends PeopleDetailsState {
  final String message;

  PeopleDetailsError(this.message);
}

