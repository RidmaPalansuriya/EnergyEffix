class User {
  String usersFName;
  String usersLName;
  String usersEmail;
  String usersUId;
  String usersPwd;

  User(
    this.usersFName,
    this.usersLName,
    this.usersEmail,
    this.usersUId,
    this.usersPwd,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
      json['usersFName'],
      json['usersLName'],
      json['usersEmail'],
      json['usersUId'],
      json['usersPwd']);

  Map<String, dynamic> toJson() => {
        'usersFName': usersFName,
        'usersLName': usersLName,
        'usersEmail': usersEmail,
        'usersUId': usersUId,
        'usersPwd': usersPwd,
      };
}
