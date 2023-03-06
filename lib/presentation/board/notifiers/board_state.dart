part of 'board.dart';

@freezed
class BoardState with _$BoardState {
  factory BoardState.initial() = _Initial;

  factory BoardState.loaded() = _Loaded;

  factory BoardState.networkError(String message) = _NetworkError;
}
