part of 'services.dart';

class EventServices with ChangeNotifier {
  Future<List<EventModel>> fetchEvent() async {
    try {
      var response = await http.get(Uri.parse(BASEURL.apiFetchEvents));

      if (response.statusCode == 200) {
        List<EventModel> listEvents = [];
        List parseJson = jsonDecode(response.body);

        for (var event in parseJson) {
          listEvents.add(EventModel.fromJSON(event));
        }

        return listEvents;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<String?> addEvent(
      String? catEvent,
      String? title,
      String? description,
      String? organized,
      String? date,
      String? time,
      String? location,
      String? id,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'cat_event': catEvent,
        'title': title,
        'description': description,
        'organized': organized,
        'date': date,
        'time': time,
        'location': location,
        'created_by': id,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiAddEvents), body: body);

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

  Future<String?> updateEvent(String? id, String? title, String? description,
      String? date, String? time, String? location,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
        'time': time,
        'location': location,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateEvents), body: body);

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

  Future<String?> updateEventClose(String? id, {http.Client? client}) async {
    client ??= http.Client();
    try {
      var body = {
        'id': id,
      };

      var response =
          await client.post(Uri.parse(BASEURL.apiUpdateEventClose), body: body);

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
