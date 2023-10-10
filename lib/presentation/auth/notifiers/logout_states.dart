part of 'logout.dart';

@freezed
class LogoutState with _$LogoutState{


  factory LogoutState.initial() = _Initial;
  factory LogoutState.loggingOut() = _LoggingOut;
  factory LogoutState.loggedOut() = _LoggedOut;

}
