part of 'services.dart';

class UserServices with ChangeNotifier {
  Future<List<UserModel>> fetchUser() async {
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchUser));

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
    } catch (e) {
      return [];
    }
  }

  Future<String?> updateUser(String? id, String? password, String? status,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
        'password': password,
        'status': status,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateUser), body: body);

      var data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];

      if (value != 0) {
        return message;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> deleteUser(String? id, {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiDeleteUser), body: body);

      var data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];

      if (value != 0) {
        return message;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
