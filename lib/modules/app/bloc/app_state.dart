part of 'app_bloc.dart';

@JsonSerializable()
final class AppState extends Equatable {
  final bool alreadyShowBeginingTour;
  final User? user;
  final String token;
  final bool isConnected;

  const AppState(
  {
    this.alreadyShowBeginingTour = false, 
    this.user, 
    this.token = '',
    this.isConnected = true,
  });

  bool get isLogin => token != '' && user != null;

  bool get isAlreadyLogin => user != null && token.isNotEmpty;

  bool get userEmpty => token.isEmpty;

  @override
  List<Object?> get props => [alreadyShowBeginingTour, user, token];

  AppState logout() {
    return AppState(
      alreadyShowBeginingTour: alreadyShowBeginingTour,
      token: '',
      user: null,
    );
  }

  AppState copyWith(
      {
        bool? alreadyShowBeginingTour, 
        User? user, 
        ProfileModel? profile, 
        String? token,
        bool? isConnected,
      }) {
    return AppState(
      alreadyShowBeginingTour: alreadyShowBeginingTour ?? this.alreadyShowBeginingTour,
      user: user ?? this.user,
      token: token ?? this.token,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
