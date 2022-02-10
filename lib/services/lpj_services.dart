part of 'services.dart';

class LPJServices with ChangeNotifier {
  Future<String?> uploadLPJEvent(String? id, File? file,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      http.MultipartRequest request = http.MultipartRequest(
          "POST", Uri.parse(BASEURL.apiUploadLpjKegiatan));

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

  Future<String?> uploadLPJCost(
      String? id, File? file, String? costApprove, String? costUse,
      {http.Client? client}) async {
    client ??= http.Client();
    try {
      http.MultipartRequest request = http.MultipartRequest(
          "POST", Uri.parse(BASEURL.apiUploadLpjAnggaran));

      request.fields['programID'] = id!;
      request.fields['costApprove'] = costApprove!;
      request.fields['costUse'] = costUse!;
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
}
