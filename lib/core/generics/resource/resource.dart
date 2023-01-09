class Resource<E, T> {
  final E? error;
  final T? data;

  Resource({this.error, this.data,});

  get hasError => error != null;

  get hasData => data != null;
}
