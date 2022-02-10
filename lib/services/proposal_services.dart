part of 'services.dart';

class ProposalServices with ChangeNotifier {
  Future<List<ProposalModel>> fetchUsulanProker() async {
    String id = 'id';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(UserPrefProfile.idUser)!;
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchUsulan + id));

      if (response.statusCode == 200) {
        List<ProposalModel> listProposalUsulan = [];
        List parseJson = jsonDecode(response.body);

        for (var usulan in parseJson) {
          listProposalUsulan.add(ProposalModel.fromJson(usulan));
        }

        return listProposalUsulan;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String?> addUsulanProker(
    String? organizedBy,
    String? tema,
    String? description,
    String? date,
    String? time,
    String? cost,
    String? location,
    String? createdBy, {
    http.Client? client,
  }) async {
    client ??= http.Client();
    try {
      var body = {
        'organizedBy': organizedBy,
        'tema': tema,
        'description': description,
        'date': date,
        'time': time,
        'cost': cost,
        'location': location,
        'created_by': createdBy,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiAddNewUsulan), body: body);

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

  Future<String?> updateUsulanFromBem(
      String? id, String? notedUsulan, String? statusUsulan,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'prokerID': id,
        'noteUsulan': notedUsulan,
        'statusUpdate': statusUsulan,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateUsulanBEM), body: body);

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

  Future<String?> uploadProposal(String? id, File? file,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(BASEURL.apiUploadProposal));

      request.fields['programID'] = id!;
      var files = await http.MultipartFile.fromPath('file', file!.path);
      request.files.add(files);

      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      var data = jsonDecode(responseString);
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

  Future<String?> updateStatusProposal(String? id, String? notedProposal,
      String? statusProposal, String? roleName,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'prokerID': id,
        'noteProposal': notedProposal,
        'statusUpdate': statusProposal,
        'role': roleName,
      };

      var response = await client
          .post(Uri.parse(BASEURL.apiUpdateStatusProposal), body: body);

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

  Future<String?> deleteUsulanProker(String? id, {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'prokerID': id,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiDeleteUsulan), body: body);

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
