// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mhs_mobile/repositories/home_repository/models/pagination_model.dart';


class DataPagination<T> {
  final List<T> list;
  final PaginationModel paginate;
  DataPagination({this.list = const [], PaginationModel? paginate})
      : paginate = paginate ?? PaginationModel(current: 1, perPage: 1);
}
