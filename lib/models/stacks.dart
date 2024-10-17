class Stacks<T> {
  final _list = <T>[];

  void push(T value) => _list.add(value);

  T pop() => _list.removeLast();

  T get peek => _list.last;

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  void forEach(void Function(T value) callBack) {
    for (var element in _list.reversed) {
      callBack(element);
    }
  }

  @override
  String toString() => _list.toString();

  void clear() {
    _list.clear();
  }
}
