class Clothe {
  final int? id;
  final String imagePath;
  final String name;
  final bool dirty;
  final String type;
  final String style;
  final String brand;
  final String createdAt;
  final String updatedAt;

  Clothe({
    this.id,
    required this.imagePath,
    required this.name,
    required this.dirty,
    required this.type,
    required this.style,
    required this.brand,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'dirty': dirty ? 1 : 0,
      'type': type,
      'style': style,
      'brand': brand,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Clothe.fromMap(Map<String, dynamic> map) {
    return Clothe(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      dirty: map['dirty'] == 1,
      type: map['type'],
      style: map['style'],
      brand: map['brand'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
