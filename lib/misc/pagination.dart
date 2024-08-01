class Pagination {
  int? totalItems;
  int? totalPages;
  int? currentPage;
  int? previous;
  int? next;

  Pagination(
      {this.totalItems,
      this.totalPages,
      this.currentPage,
      this.previous,
      this.next});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItems'] = totalItems;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    data['previous'] = previous;
    data['next'] = next;
    return data;
  }
}
