// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

@JsonSerializable()
class NotificationState extends Equatable {
  final double scrollP;
  final Pagination pagination;
  final List<NotifData>? notif;
  final List<PaymentData>? payment;
  final DetailNotifModel? detailNotif;
  final int tabIndex;
  final int countNotif;
  final int countTrasaction;
  final int idNotif;
  final bool loading;
  final int nextPageBroadcast;

  const NotificationState({
    this.scrollP = 0,
    required this.pagination,
    this.notif = const [],
    this.payment = const [],
    this.detailNotif,
    this.tabIndex = 0,
    this.countNotif = 0,
    this.countTrasaction = 1,
    this.idNotif = 0,
    this.loading = true,
    this.nextPageBroadcast = 0,
  });


  @override
  List<Object?> get props => [
    scrollP,
    pagination,
    notif,
    payment,
    detailNotif,
    tabIndex,
    countNotif,
    countTrasaction,
    idNotif,
    loading,
    nextPageBroadcast
  ];

  NotificationState copyWith({
    double? scrollP,
    Pagination? pagination,
    List<NotifData>? notif,
    List<PaymentData>? payment,
    DetailNotifModel? detailNotif,
    int? tabIndex,
    int? countNotif,
    int? countTrasaction,
    int? idNotif,
    bool? loading,
    int? nextPageBroadcast
  }){
    return NotificationState(
      pagination: pagination ?? this.pagination,
      scrollP: scrollP ?? this.scrollP,
      notif: notif ?? this.notif,
      payment: payment ?? this.payment,
      detailNotif: detailNotif ?? this.detailNotif,
      tabIndex: tabIndex ?? this.tabIndex,
      countNotif: countNotif ?? this.countNotif,
      countTrasaction: countTrasaction ?? this.countTrasaction,
      idNotif: idNotif ?? this.idNotif,
      loading: loading ?? this.loading,
      nextPageBroadcast: nextPageBroadcast ?? this.nextPageBroadcast,
    );
  }
}