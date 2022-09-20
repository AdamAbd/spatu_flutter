part of 'page_stack_cubit.dart';

class PageStackState extends Equatable {
  const PageStackState({
    required this.page,
  });

  final String page;

  @override
  List<Object> get props => [page];

  PageStackState copyWith({
    String? page,
  }) {
    return PageStackState(
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
    };
  }

  factory PageStackState.fromMap(Map<String, dynamic> map) {
    return PageStackState(
      page: map['page'].toString(),
    );
  }
}
