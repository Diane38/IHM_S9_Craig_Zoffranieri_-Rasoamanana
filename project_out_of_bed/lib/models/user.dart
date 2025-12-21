class User {
  final String pseudo;
  final String email;
  final String password;
  final String phone;

  User({
    required this.pseudo,
    required this.email,
    required this.password,
    required this.phone,
  });
}

final List<User> users = [
  User(
    pseudo: 'Pierre',
    email: 'pierre@gmail.com',
    password: 'Leblanc',
    phone: '06 12 34 56 78',
  ),
  User(
    pseudo: 'Anne',
    email: 'anne@gmail.com',
    password: 'Dupont',
    phone: '06 87 65 43 21',
  ),
];

User? findingUser(String pseudo, String password) {
  try {
    return users.firstWhere(
      (user) => user.pseudo == pseudo && user.password == password,
    );
  } catch (e) {
    return null;
  }
}

bool emailExists(String email) {
  return users.any((user) => user.email == email);
}

void addUser(User newUser) {
  users.add(newUser);
}