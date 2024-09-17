// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

@JsonSerializable()
class NotificationState extends Equatable {
  final double scrollP;
  final Pagination pagination;
  final List<NotifData>? notif;
  final List<PaymentData>? payment;
  final int tabIndex;
  final bool loading;
  final int nextPageBroadcast;

  const NotificationState({
    this.scrollP = 0,
    required this.pagination,
    this.notif = const [],
    this.payment = const [],
    this.tabIndex = 0,
    this.loading = true,
    this.nextPageBroadcast = 0,
  });


  @override
  List<Object?> get props => [
    scrollP,
    pagination,
    notif,
    payment,
    tabIndex,
    loading,
    nextPageBroadcast
  ];

  NotificationState copyWith({
    double? scrollP,
    Pagination? pagination,
    List<NotifData>? notif,
    List<PaymentData>? payment,
    int? tabIndex,
    bool? loading,
    int? nextPageBroadcast
  }){
    return NotificationState(
      pagination: pagination ?? this.pagination,
      scrollP: scrollP ?? this.scrollP,
      notif: notif ?? this.notif,
      payment: payment ?? this.payment,
      tabIndex: tabIndex ?? this.tabIndex,
      loading: loading ?? this.loading,
      nextPageBroadcast: nextPageBroadcast ?? this.nextPageBroadcast,
    );
  }
}