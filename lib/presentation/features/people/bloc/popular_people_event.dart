part of 'popular_people_bloc.dart';

@immutable
sealed class PopularPeopleEvent {}

class GetPopularPeopleEvent extends PopularPeopleEvent {
  final int page;

  GetPopularPeopleEvent({required this.page});
}
