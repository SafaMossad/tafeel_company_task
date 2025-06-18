class BaseModel<T> {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  String? error;
  T? data;

  BaseModel({
    this.page,
    this.totalPages,
    this.error,
    this.perPage,
    this.total,
    this.data,
  });

  void copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    String? error,
    T? data,
    // InvitedUser? invitedUser,
  }) {
    this.page = page ?? this.page;
    this.totalPages = totalPages ?? this.totalPages;
    this.error = error ?? this.error;
    this.perPage = perPage ?? this.perPage;
    this.total = total ?? this.total;
    this.data = data ?? this.data;
  }

  factory BaseModel.fromJson(Map<String, dynamic>? json) => BaseModel(
        page: json?['page'],
        totalPages: json?['total_pages'],
        error: json?['error'],
        data: json?['data'],
        perPage: json?['per_page'],
        total: json?['total'],
      );
}
