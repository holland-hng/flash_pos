enum BaseState {
  idle,
  fetching,
  fetchSuccess,
  fetchError,
}

extension BaseStateExtension on BaseState {
  bool get isFetching => this == BaseState.fetching || this == BaseState.idle;
  bool get isSuccess => this == BaseState.fetchSuccess;
  bool get isError => this == BaseState.fetchError;
}
