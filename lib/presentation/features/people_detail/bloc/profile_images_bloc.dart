import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info/domain/usecases/get_profile_images.dart';

import '../../../../domain/entities/ProfileImage.dart';

part 'profile_images_event.dart';
part 'profile_images_state.dart';

class ProfileImagesBloc extends Bloc<ProfileImagesEvent, ProfileImagesState> {
  final GetProfileImages  getProfileImages;

  ProfileImagesBloc({required this.getProfileImages}) : super(ProfileImagesInitial()) {

    on<GetProfileImagesEvent>((event, emit) async {
      emit(ProfileImagesLoading());
      final result = await getProfileImages(event.personId);
      result.fold(
        (failure) => emit(ProfileImagesError(failure.message)),
        (profileImages) => emit(ProfileImagesLoaded(profileImages))
      );
    });
  }
}
