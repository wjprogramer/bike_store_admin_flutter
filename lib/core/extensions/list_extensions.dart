extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];

    for (int i = 0; i < this.length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  Iterable<R> mapWithIndexIterable<R>(R Function(T, int i) callback) {
    return this.asMap().keys.toList().map((index) => callback(this[index], index));
  }
}