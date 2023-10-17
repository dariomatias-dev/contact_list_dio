class BasicContactModel {
  BasicContactModel({
    this.objectId,
    this.profilePicturePath,
    required this.name,
    required this.number,
  });

  final String? objectId;
  final String? profilePicturePath;
  final String name;
  final String number;

  factory BasicContactModel.fromMap(Map<String, dynamic> map) {
    return BasicContactModel(
      objectId: map['objectId'],
      profilePicturePath: map['profile_picture_path'],
      name: map['name'],
      number: map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'profile_picture_path': profilePicturePath,
      'name': name,
      'number': number,
    };
  }
}
