class NexusDateTimeRange {
  NexusDateTimeRange({
    required this.current,
    this.end,
    this.start,
  });

  final DateTime current;

  final DateTime? start;

  final DateTime? end;

  Duration? get duration => end?.difference(current);

  NexusDateTimeRange copyWith({
    DateTime? current,
    DateTime? end,
    DateTime? start,
  }) {
    return NexusDateTimeRange(
      current: current ?? this.current,
      end: end ?? this.end,
      start: start ?? this.start,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is NexusDateTimeRange &&
        other.current == current &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode => hashValues([current, start, end]);

  int hashValues(List<Object?> values) {
    return values.fold(0, (hash, value) {
      return _combine(hash, value.hashCode);
    });
  }

  int _combine(int hash, int value) {
    const int hashPrime = 0x1fffffff; // Um número primo para dispersão

    return (hash * 31 + value) & hashPrime;
  }

  @override
  String toString() => '{current: $current, start: $start, end: $end}';
}
