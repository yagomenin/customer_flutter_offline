import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  factory Customer.fromMap(Map<String, dynamic> map) => Customer(
    id: map['id'] is int
        ? map['id']
        : int.tryParse(map['id']?.toString() ?? '') ?? 0,
    name: map['name']?.toString() ?? '',
    cellphone: map['cellphone']?.toString() ?? '',
    email: map['email']?.toString(),
    createAt: DateTime.tryParse(map['create_at'] ?? ''),
    writeAt: DateTime.tryParse(map['write_at'] ?? ''),
  );

  const Customer({
    required this.id,
    required this.name,
    required this.cellphone,
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
    data['cellphone'] = cellphone;
    data['email'] = email;
    data['create_at'] = createAt?.toIso8601String();
    data['write_at'] = writeAt?.toIso8601String();
    return data;
  }

  static String get tableName => 'customer';

  @override
  List<Object?> get props => [id, name, cellphone, email, createAt, writeAt];
}
