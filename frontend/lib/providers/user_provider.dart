import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _id = "";
  String _email = "";
  String _username = "";
  String _type = "guest";
  String _verified = "false";

  List<String> get userInfo {
    return [_id, _email, _username, _type, _verified];
  }

  void setUser(
      String id, String email, String username, String type, String verified) {
    _id = id;
    _email = email;
    _username = username;
    _type = type;
    _verified = verified;
    notifyListeners();
  }

  void removeUser(String x) {
    _id = "";
    _email = "";
    _username = "";
    _type = "guest";
    _verified = "rejected";
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    notifyListeners();
  }

  bool get isAuthenticated {
    return this._id != "";
  }

  bool get isAdmin {
    return this._type == "admin";
  }

  bool get isGuest {
    return this._type == "guest";
  }

  bool get isVerified {
    return this._verified != "";
  }
}
