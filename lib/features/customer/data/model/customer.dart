import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  factory Customer.fromMap(Map<String, dynamic> map) => Customer(
    id: map['id'] is int
        ? map['id']
        : int.tryParse(map['id']?.toString() ?? '') ?? 0,
    name: map['name']?.toString() ?? '',
    cellphone: map['phone']?.toString() ?? '',
    email: map['email']?.toString(),
    createAt: DateTime.tryParse(map['create_at'] ?? ''),
    writeAt: DateTime.tryParse(map['write_at'] ?? ''),
  );

  const Customer({
    this.id = 0,
    this.name = '',
    this.cellphone = '',
    this.email,
    this.createAt,
    this.writeAt,
  });

  final int id;
  final String name;
  final String cellphone;
  final String? email;
  final DateTime? createAt;
  final DateTime? writeAt;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['phone'] = cellphone;
    data['email'] = email;
    data['create_at'] = createAt?.toIso8601String();
    data['write_at'] = writeAt?.toIso8601String();
    return data;
  }

  Customer copyWith({
    int? id,
    String? name,
    String? cellphone,
    String? email,
    DateTime? createAt,
    DateTime? writeAt,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      cellphone: cellphone ?? this.cellphone,
      email: email ?? this.email,
      createAt: createAt ?? this.createAt,
      writeAt: writeAt ?? this.writeAt,
    );
  }

  static String get tableName => 'customer';

  @override
  List<Object?> get props => [id, name, cellphone, email, createAt, writeAt];
}
