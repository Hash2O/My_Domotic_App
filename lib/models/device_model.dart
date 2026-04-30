class DeviceModel {
  final int id;
  final String name;
  final String type;
  final bool isOn;

  DeviceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.isOn,
  });

  // Avec BLoC, on évite de modifier directement les objets.
  // on crée de nouvelles versions immuables en utilisant copyWith:
  DeviceModel copyWith({
    int? id,
    String? name,
    String? type,
    bool? isOn,
  }) {
    return DeviceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      isOn: isOn ?? this.isOn,
    );
  }
}