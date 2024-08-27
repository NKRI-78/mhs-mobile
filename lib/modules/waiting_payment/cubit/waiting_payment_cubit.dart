import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/payment_repository.dart';

part 'waiting_payment_state.dart';

class WaitingPaymentCubit extends Cubit<WaitingPaymentState> {
  WaitingPaymentCubit({required this.id}) : super(const WaitingPaymentState());

  final String id;

  PaymentRepository paymentRepo = PaymentRepository();

  Future<void> init() async {
    try {
      var payment = await paymentRepo.findPayment(id);
      emit(state.copyWith(loading: false, payment: payment));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> close() {
    if (getIt.isRegistered<HomeBloc>()) {
      getIt<HomeBloc>().add(HomeInitialData());
    }
    return super.close();
  }
}
