class User {
  final String? Id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? image;
  const User(
      {this.Id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.image});
  factory User.fromjson(Map<String, dynamic> data) {
    return User(
        Id: data['Id'],
        firstName: data['firstName'],
        lastName: data['lastname'],
        email: data['email'],
        gender: data['gender'],
        image: data['image']);
  }
}
