import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/models/payment_channel_model.dart';
import 'package:mhs_mobile/repositories/payment_repository/payment_repository.dart';

part 'new_student_payment_state.dart';

class NewStudentPaymentCubit extends Cubit<NewStudentPaymentState> {
  NewStudentPaymentCubit({required this.student})
      : super(const NewStudentPaymentState());

  final NewStudentModel student;

  final PaymentRepository paymentRepo = PaymentRepository();

  Future<void> getPaymentChannel() async {
    try {
      var channels = await paymentRepo.getChannels();

      emit(state.copyWith(channels: channels));
    } catch (e) {
      ///
    }
  }

  void setPaymentChannel(PaymentChannelModel e) {
    emit(state.copyWith(channel: e));
  }

  Future<void> checkout() async {
    try {
      ////
    } catch (e) {
      rethrow;
    }
  }
}
