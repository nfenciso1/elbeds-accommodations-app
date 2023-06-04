import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _id = "";
  String _email = "";
  String _username = "";
  String _type = "guest";
  bool _verified = false;

  List<dynamic> get userInfo {
    return [_id, _email, _username, _type, _verified];
  }

  void setUser(
      String id, String email, String username, String type, bool verified) {
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
    _verified = false;
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    notifyListeners();
  }

  bool get isAuthenticated {
    return this._id != "";
  }

  bool get isAdmin {
    return this._type == "admin";
  }

  bool get isOwner {
    return this._type == "owner";
  }

  bool get isGuest {
    return this._type == "guest";
  }

  bool get isVerified {
    return this._verified;
  }
}
