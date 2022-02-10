part of 'services.dart';

class StaffServices with ChangeNotifier {
  Future<List<StaffModel>> fetchStaff() async {
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchStaff));

      if (response.statusCode == 200) {
        List<StaffModel> listStaff = [];
        List parseJson = jsonDecode(response.body);

        for (var staff in parseJson) {
          listStaff.add(StaffModel.fromJson(staff));
        }

        return listStaff;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String?> addStaff(
      String? fullname, String? email, String? period, String? position,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'fullname': fullname,
        'email': email,
        'period': period,
        'position': position,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiAddStaff), body: body);

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

  Future<String?> updateStaff(String? id, String? fullname, String? email,
      String? period, String? position,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
        'fullname': fullname,
        'email': email,
        'periode': period,
        'jabatan': position,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateStaff), body: body);

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

  Future<String?> deleteStaff(String? id, {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiDeleteStaff), body: body);

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

  Future<List<OrmawaModel>> fetchListOrmawa() async {
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchOrmawa));

      if (response.statusCode == 200) {
        List<OrmawaModel> listOrmawa = [];
        List parseJson = jsonDecode(response.body);

        for (var ormawa in parseJson) {
          listOrmawa.add(OrmawaModel.fromJson(ormawa));
        }

        return listOrmawa;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
