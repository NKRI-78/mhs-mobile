part of 'app_bloc.dart';

@JsonSerializable()
final class AppState extends Equatable {
  final bool alreadyShowBeginingTour;

  const AppState({this.alreadyShowBeginingTour = false});

  @override
  List<Object?> get props => [
        alreadyShowBeginingTour,
      ];

  AppState copyWith({
    bool? alreadyShowBeginingTour,
  }) {
    return AppState(
      alreadyShowBeginingTour:
          alreadyShowBeginingTour ?? this.alreadyShowBeginingTour,
    );
  }
}
