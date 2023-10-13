class ContactModel {
  ContactModel({
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

  final String? profilePicturePath;
  final String name;
  final String? nickname;
  final String number;
  final String? email;
  final String? address;
  final String grades;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ContactModel.toMap(Map<String, dynamic> map) {
    return ContactModel(
      profilePicturePath: map['profilePicturePath'],
      name: map['name'],
      nickname: map['nickname'],
      number: map['number'],
      email: map['email'],
      address: map['address'],
      grades: map['grades'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profilePicturePath': profilePicturePath,
      'name': name,
      'nickname': nickname,
      'number': number,
      'email': email,
      'address': address,
      'grades': grades,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
