class ContactModel {
  ContactModel({
    this.objectId,
    this.profilePicturePath,
    required this.name,
    this.nickname,
    required this.number,
    this.email,
    this.address,
    required this.grades,
    this.createdAt,
    this.updatedAt,
  });

  final String? objectId;
  final String? profilePicturePath;
  final String name;
  final String? nickname;
  final String number;
  final String? email;
  final String? address;
  final String? grades;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      objectId: map['objectId'],
      profilePicturePath: map['profile_picture_path'],
      name: map['name'],
      nickname: map['nickname'],
      number: map['number'],
      email: map['email'],
      address: map['address'],
      grades: map['grades'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'profilePicturePath': profilePicturePath,
      'name': name,
      'nickname': nickname,
      'number': number,
      'email': email,
      'address': address,
      'grades': grades,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
