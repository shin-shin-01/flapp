import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_state.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, AsyncValue<HomeState>>(
  (ref) => HomeViewModel(ref: ref),
);

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  HomeViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  // 初期化
  void load() {
    state = const AsyncValue.data(
      HomeState(count: 0),
    );
  }

  // カウントを+1
  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      HomeState(count: count + 1),
    );
  }
}
