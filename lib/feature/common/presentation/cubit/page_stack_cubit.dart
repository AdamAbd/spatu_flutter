import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'page_stack_state.dart';

class PageStackCubit extends HydratedCubit<PageStackState> {
  PageStackCubit() : super(const PageStackState(page: 'login'));

  Future<void> saveStack({required String page}) async {
    emit(state.copyWith(page: page));
  }

  @override
  PageStackState? fromJson(Map<String, dynamic> json) {
    try {
      return PageStackState(page: json['page'].toString());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic>? toJson(PageStackState state) {
    try {
      return {'page': state.page};
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
