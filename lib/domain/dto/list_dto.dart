class ListDto<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T>? results;

  ListDto({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ListDto.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ListDto(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}