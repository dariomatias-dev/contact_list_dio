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
    final String? profilePicturePathValue = map['profile_picture_path'];
    final String? nicknameValue = map['nickname'];
    final String? emailValue = map['email'];
    final String? addressValue = map['address'];
    final String? gradesValue = map['grades'];

    return ContactModel(
      objectId: map['objectId'],
      profilePicturePath:
          profilePicturePathValue != null && profilePicturePathValue.isNotEmpty
              ? profilePicturePathValue
              : null,
      name: map['name'],
      nickname: nicknameValue != null && nicknameValue.isNotEmpty
          ? nicknameValue
          : null,
      number: map['number'],
      email: emailValue != null && emailValue.isNotEmpty ? emailValue : null,
      address:
          addressValue != null && addressValue.isNotEmpty ? addressValue : null,
      grades:
          gradesValue != null && gradesValue.isNotEmpty ? gradesValue : null,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'profile_picture_path': profilePicturePath,
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
