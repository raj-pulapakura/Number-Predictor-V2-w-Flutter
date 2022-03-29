class StructStack<T> {
  List<T> load = [];

  push(T value) {
    load.add(value);
  }

  T pop() {
    return load.removeLast();
  }

  clear() {
    load = [];
  }
}
