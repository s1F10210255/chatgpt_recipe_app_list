class Recipe {
  final String name;
  final List<String> images;
  final double rating;
  final String totalTime;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory Recipe.fromJson(dynamic json) {
    // images に関してはエラーハンドリングを追加しています。
    return Recipe(
        name: json['name'] as String,
        images: (json['images'] as List?)?.isEmpty ?? true
            ? []
            : [json['images'][0]['hostedLargeUrl'] ?? ''],
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String
    );
  }

  static List<Recipe> recipesFromSnapshot(List<dynamic> snapshot) {
    // mapメソッドに型を明示的に指定しています。
    return snapshot.map<Recipe>((dynamic data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
