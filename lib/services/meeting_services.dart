part of 'services.dart';

class MeetingServices with ChangeNotifier {
  Future<List<MeetingModel>> fetchMeeting() async {
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchMeeting));

      if (response.statusCode == 200) {
        List<MeetingModel> listMeeting = [];
        List parseJson = jsonDecode(response.body);

        for (var meeting in parseJson) {
          listMeeting.add(MeetingModel.fromJson(meeting));
        }

        return listMeeting;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String?> addMeeting(String? tema, String? subtema, String? dateMeeting,
      String? timeMeeting, String? location, String? createdBy,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'tema': tema,
        'subtema': subtema,
        'tgl_rapat': dateMeeting,
        'time': timeMeeting,
        'lokasi': location,
        'created_by': createdBy,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiAddMeeting), body: body);

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

  Future<String?> updateMeeting(String? id, String? tema, String? subtema,
      String? dateMeeting, String? timeMeeting, String? location,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
        'tema': tema,
        'subtema': subtema,
        'tgl_rapat': dateMeeting,
        'time': timeMeeting,
        'lokasi': location,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateMeeting), body: body);

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
