
class GetUserModel {
  String? name;
  String? email;
  String? imageUrl;

  GetUserModel({this.name, this.email, this.imageUrl});

  
  GetUserModel.fromJson( data) {
      name = data['name'];
      email = data['email'];
  }
}


extension GetUserModelX on GetUserModel {
  UserModelEntity toEntity() {
    return UserModelEntity(
      name: name!,
      email: email!,
      imageUrl: imageUrl!
    );
  }
}


class UserModelEntity {
  final String name;
  final String email;
  final String imageUrl;

  UserModelEntity({required this.name, required this.email, required this.imageUrl,});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }
}
