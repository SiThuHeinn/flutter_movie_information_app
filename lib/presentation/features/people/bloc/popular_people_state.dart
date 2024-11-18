part of 'popular_people_bloc.dart';


class PopularPeopleState {
  final Status state;
  final List<People> people;
  final String message;
  final int page;
  int totalPages;

  PopularPeopleState( {
    this.page = 0,
    this.totalPages = 0,
    required this.state,
    required this.people,
    required this.message
  });

  factory PopularPeopleState.init() {
    return PopularPeopleState(
      state: Status.init,
      people: [],        // Start with an empty list of people
      message: '',       // No error message initially
      page: 0,           // Start from the first page
      totalPages: 1,     // Set totalPages to a minimum of 1 to avoid premature stopping
    );
  }

  PopularPeopleState copyWith({
    Status? state,
    List<People>? people,
    String? message,
    int? page,
    int? totalPages,
  }) {
    return PopularPeopleState(
      state: state ?? this.state,
      people: people ?? this.people,
      message: message ?? this.message,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
    );
  }

}

enum Status {
  init,
  loading,
  loaded,
  endOfList,
  error
}

