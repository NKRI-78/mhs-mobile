// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_student_payment_cubit.dart';

class NewStudentPaymentState extends Equatable {
  final List<PaymentChannelModel> channels;
  final PaymentChannelModel? channel;
  final bool loading;

  const NewStudentPaymentState(
      {this.channels = const [], this.channel, this.loading = false});
  @override
  List<Object?> get props => [channels, channel, loading];

  NewStudentPaymentState copyWith({
    List<PaymentChannelModel>? channels,
    PaymentChannelModel? channel,
    bool? loading,
  }) {
    return NewStudentPaymentState(
      channels: channels ?? this.channels,
      channel: channel ?? this.channel,
      loading: loading ?? this.loading,
    );
  }
}
