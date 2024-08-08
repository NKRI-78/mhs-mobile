part of 'app_bloc.dart';

@JsonSerializable()
final class AppState extends Equatable {
  final bool alreadyShowBeginingTour;
  final User? user;
  final String token;

  const AppState(
      {this.alreadyShowBeginingTour = false, this.user, this.token = ''});

  bool get isLogin => token != '' && user != null;

  @override
  List<Object?> get props => [alreadyShowBeginingTour, user, token];

  AppState copyWith(
      {bool? alreadyShowBeginingTour, User? user, String? token}) {
    return AppState(
      alreadyShowBeginingTour:
          alreadyShowBeginingTour ?? this.alreadyShowBeginingTour,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
