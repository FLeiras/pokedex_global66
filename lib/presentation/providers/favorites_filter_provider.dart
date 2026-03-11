import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_filter_provider.g.dart';

@riverpod
class FavoritesFilter extends _$FavoritesFilter {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
