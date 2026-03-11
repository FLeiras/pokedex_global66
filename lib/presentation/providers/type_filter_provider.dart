import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_filter_provider.g.dart';

@riverpod
class TypeFilter extends _$TypeFilter {
  @override
  Set<String> build() {
    return {};
  }

  void toggle(String type) {
    if (state.contains(type)) {
      state = {...state}..remove(type);
    } else {
      state = {...state, type};
    }
  }

  void clear() {
    state = {};
  }
}
