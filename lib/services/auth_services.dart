part of 'services.dart';

class AuthServices with ChangeNotifier {
  // SIGN UP SERVICES
  Future<UserModel?> signup(
    String? role,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? nameOrmawa, {
    http.Client? client,
  }) async {
    client ??= http.Client();

    try {
      var body = {
        'rolename': role,
        'fullname': name,
        'phone': phone,
        'email': email,
        'password': password,
        'ormawa': nameOrmawa,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiSignUp), body: body);

      var data = jsonDecode(response.body);
      int value = data['value'];

      if (value != 0) {
        return UserModel.fromJSON(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // SIGN IN SERVICES
  Future<UserModel?> signin(
    String? role,
    String? email,
    String? password, {
    http.Client? client,
  }) async {
    client ??= http.Client();

    try {
      var body = {
        'role': role,
        'email': email,
        'password': password,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiSignIn), body: body);

      var data = jsonDecode(response.body);
      int value = data['value'];

      if (value != 0) {
        String idUser = data['idUser'];
        String idRole = data['idRole'];
        String fullname = data['fullname'];
        String emailUser = data['email'];
        String phone = data['phone'];
        String createddatetime = data['createddatetime'];

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString(UserPrefProfile.idUser, idUser);
        sharedPreferences.setString(UserPrefProfile.idRole, idRole);
        sharedPreferences.setString(UserPrefProfile.fullname, fullname);
        sharedPreferences.setString(UserPrefProfile.email, emailUser);
        sharedPreferences.setString(UserPrefProfile.phone, phone);
        sharedPreferences.setString(
            UserPrefProfile.createddatetime, createddatetime);
        sharedPreferences.setBool(UserPrefProfile.isLogin, true);

        return UserModel.fromJSON(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<UserModel>> fetchUserProfile() async {
    String? id = 'id';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(UserPrefProfile.idUser);
    try {
      if (id != null) {
        var response = await http.get(Uri.parse(BASEURL.apiUserProfile + id));

        if (response.statusCode == 200) {
          List<UserModel> listUser = [];
          List parseJson = jsonDecode(response.body);

          for (var user in parseJson) {
            listUser.add(UserModel.fromJSON(user));
          }

          return listUser;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
