part of 'profile_images_bloc.dart';

@immutable
sealed class ProfileImagesState {}

final class ProfileImagesInitial extends ProfileImagesState {}

final class ProfileImagesLoading extends ProfileImagesState {}

final class ProfileImagesLoaded extends ProfileImagesState {
  final List<ProfileImage> profileImages;

  ProfileImagesLoaded(this.profileImages);
}

final class ProfileImagesError extends ProfileImagesState {
  final String message;

  ProfileImagesError(this.message);
}
