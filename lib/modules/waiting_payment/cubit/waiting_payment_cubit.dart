import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'waiting_payment_state.dart';

class WaitingPaymentCubit extends Cubit<WaitingPaymentState> {
  WaitingPaymentCubit({required this.id}) : super(WaitingPaymentState());

  final String id;

  Future<void> init() async {}
}
