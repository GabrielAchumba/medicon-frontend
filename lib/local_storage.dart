import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kUserBox = 'userBox';
const String isFirst = 'isFirsterterrtt';
const String filledProfileKey = 'use-pinhffhf';

class AppCache {
  saveUserData({
    String? username,
    String? bio,
    String? email,
    String? image,
    String? location,
    String? id,
    String? phone,
  }) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("username", username.toString());
    sf.setString("bio", bio.toString());
    sf.setString("image", image.toString());
    sf.setString("email", email.toString());
    sf.setString("location", location.toString());
    sf.setString("id", id.toString());
    sf.setString("phone", phone.toString());

  }

   getUsername() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    final String? data = sf.getString("username");
    print(data);
    return data;
  }
  getProfilePic() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    final String? data = sf.getString("image");
    print(data);
    return data;
  }


  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

  static void haveFirstView() {
    _userBox.put(isFirst, false);
  }

  static bool getIsFirst() {
    final bool data = _userBox.get(isFirst, defaultValue: true);
    return data;
  }



  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
