class ChildrenModel {
    String id;
    String fullName;
    String phoneNumber;
    String picture;

    ChildrenModel({
        required this.id,
        required this.fullName,
        required this.phoneNumber,
        required this.picture,
    });

    factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        picture: json["picture"],
    );
}