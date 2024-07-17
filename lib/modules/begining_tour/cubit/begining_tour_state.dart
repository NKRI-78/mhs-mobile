part of 'begining_tour_cubit.dart';

final class BeginingTourState extends Equatable {
  final int index;

  const BeginingTourState({this.index = 0});

  @override
  List<Object?> get props => [index];

  BeginingTourState copyWith({
    int? index,
  }) {
    return BeginingTourState(
      index: index ?? this.index,
    );
  }
}

List<BeginingTour> listTour = [
  BeginingTour(
      title: 'Modul',
      description: 'Pada Fitur ini para pelajar dapat dengan mudah dan fleksibel membuka modul yang di berikan. Terdapat jadwal pelajaran pada bagian fitur ini.',
      assets: 'assets/images/begining_back_0.png'),
  BeginingTour(
      title: 'Absensi',
      description: 'Fitur unik bagi para siswa untuk melakukan absensi secara online, dan akan langsung tercatat pada database.',
      assets: 'assets/images/begining_back_1.png'),
  BeginingTour(
      title: 'Student Report',
      description:
          'Para orangtua kini bisa dengan mudah melihat report hasil pembelajaran anaknya, dan akan mengetahui Live report absensi anak setiap harinya.',
      assets: 'assets/images/begining_back_2.png'),
];
