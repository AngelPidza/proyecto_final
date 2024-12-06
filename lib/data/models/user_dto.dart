import '../../domain/entities/user.dart';

class UserDto extends User {
  UserDto({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    print('Creating UserDto from json: $json'); // Debug log
    final dto = UserDto(
      id: json['_id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
    print('Created UserDto: $dto'); // Debug log
    return dto;
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id, // Aquí mantenemos el id como String
      'email': email,
      'name': name,
    };
  }
}
