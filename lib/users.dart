class User {
  User({
    required this.name,
    required this.avatarAsset,
    required this.isSpeaking,
  });

  final String name;
  final String avatarAsset;
  final bool isSpeaking;
}

final users = [
  User(
    name: 'Zétény',
    avatarAsset: 'assets/images/profile1.jpg',
    isSpeaking: true,
  ),
  User(
    name: 'Leanna',
    avatarAsset: 'assets/images/profile2.jpg',
    isSpeaking: false,
  ),
  User(
    name: 'Hassan',
    avatarAsset: 'assets/images/profile3.jpg',
    isSpeaking: false,
  ),
  User(
    name: 'Silvia',
    avatarAsset: 'assets/images/profile4.jpg',
    isSpeaking: false,
  ),
  User(
    name: 'Enrique',
    avatarAsset: 'assets/images/profile5.jpg',
    isSpeaking: false,
  ),
  User(
    name: 'Ada',
    avatarAsset: 'assets/images/profile6.jpg',
    isSpeaking: true,
  ),
  User(
    name: 'Gayle',
    avatarAsset: 'assets/images/profile7.jpg',
    isSpeaking: false,
  ),
];
