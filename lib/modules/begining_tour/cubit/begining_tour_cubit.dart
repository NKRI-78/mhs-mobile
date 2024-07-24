import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/begining_tour/models/begining_tour_model.dart';
import 'package:mhs_mobile/router/builder.dart';

part 'begining_tour_state.dart';

class BeginingTourCubit extends Cubit<BeginingTourState> {
  BeginingTourCubit() : super(const BeginingTourState());

  static PageController pageController = PageController();

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void nextPage() {
    BeginingTourCubit.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void finish(BuildContext context) {
    context.read<AppBloc>().add(FinishBeginingTour());
    HomeRoute().go(context);
  }
}
