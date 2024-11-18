part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitialState extends SplashState {}

final class SplashDisplayState extends SplashState {}

final class SplashFinishState extends SplashState {}


