class ContactModel {
  ContactModel({
    required this.name,
    required this.nickname,
    required this.number,
    required this.email,
    required this.address,
    required this.grades,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final String nickname;
  final String number;
  final String email;
  final String address;
  final String grades;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ContactModel.toMap(Map<String, dynamic> map) {
    return ContactModel(
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
      'name': name,
      'nickname': nickname,
      'number': number,
      'email': email,
      'address': address,
      'grades': grades,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }
}
