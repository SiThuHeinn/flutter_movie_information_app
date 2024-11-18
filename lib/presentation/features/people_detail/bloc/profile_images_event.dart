part of 'profile_images_bloc.dart';

@immutable
sealed class ProfileImagesEvent {}

class GetProfileImagesEvent extends ProfileImagesEvent {
  final int personId;

  GetProfileImagesEvent(this.personId);
}
