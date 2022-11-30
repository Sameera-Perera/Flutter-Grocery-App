import 'package:hive/hive.dart';

import '../../model/user.dart';

class LocalAuthService {
  late Box<String> _tokenBox;
  late Box<User> _userBox;

  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _userBox = await Hive.openBox<User>('user');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox.put('token', token);
  }

  Future<void> addUser({required User user}) async {
    await _userBox.put('user', user);
  }

  Future<void> clear() async {
    await _tokenBox.clear();
    await _userBox.clear();
  }

  String? getToken() => _tokenBox.get('token');
  User? getUser() => _userBox.get('user');
}