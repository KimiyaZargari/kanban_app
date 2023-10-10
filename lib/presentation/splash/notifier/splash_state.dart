part of 'splash.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState.initial(double turn ) = _Initial;

  factory SplashState.loaded() = _Loaded;

}
