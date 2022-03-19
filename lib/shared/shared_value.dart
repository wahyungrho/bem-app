part of 'shared.dart';

class BASEURL {
  // development
  static String baseURL = "http://192.168.43.30/api-bem/api";
  static String baseURLAssets = "http://192.168.43.30/api-bem/assets";

  // production
  // static String baseURL =
  //     "https://ghaisan-alfarizqistore.000webhostapp.com/api";
  // static String baseURLAssets =
  //     "https://ghaisan-alfarizqistore.000webhostapp.com/assets";

  static String apiViewProposal = "$baseURLAssets/proposal/";
  static String apiViewLpjKegiatan = "$baseURLAssets/lpj_kegiatan/";
  static String apiViewLpjAnggaran = "$baseURLAssets/lpj_anggaran/";
  static String apiSignIn = "$baseURL/auth/sign_in.php";
  static String apiSignUp = "$baseURL/auth/sign_up.php";
  static String apiUserProfile = "$baseURL/auth/user_profile.php?userID=";
  static String apiFetchStaff = "$baseURL/staff/fetch_staff.php";
  static String apiAddStaff = "$baseURL/staff/add_staff.php";
  static String apiUpdateStaff = "$baseURL/staff/update_staff.php";
  static String apiDeleteStaff = "$baseURL/staff/delete_staff.php";
  static String apiFetchOrmawa = "$baseURL/ormawa/fetch_ormawa.php";
  static String apiFetchUser = "$baseURL/user/fetch_user.php";
  static String apiUpdateUser = "$baseURL/user/update_user.php";
  static String apiDeleteUser = "$baseURL/user/delete_user.php";
  static String apiFetchMeeting = "$baseURL/meetings/fetch_meeting.php";
  static String apiAddMeeting = "$baseURL/meetings/add_meeting.php";
  static String apiUpdateMeeting = "$baseURL/meetings/update_meeting.php";
  static String apiFetchEvents = "$baseURL/events/fetch_events.php";
  static String apiAddEvents = "$baseURL/events/add_events.php";
  static String apiUpdateEvents = "$baseURL/events/update_events.php";
  static String apiUpdateEventClose = "$baseURL/events/update_event_close.php";
  static String apiAddNewUsulan =
      "$baseURL/proposal/create_usuluan_program.php";
  static String apiFetchUsulan =
      "$baseURL/proposal/fetch_usulan_program.php?userID=";
  static String apiDeleteUsulan = "$baseURL/proposal/delete_usulan_program.php";
  static String apiUpdateUsulanBEM =
      "$baseURL/proposal/update_usulan_from_bem.php";
  static String apiUploadProposal = "$baseURL/proposal/upload_proposal.php";
  static String apiUpdateStatusProposal =
      "$baseURL/proposal/update_status_proposal.php";
  static String apiUploadLpjKegiatan = "$baseURL/LPJ/lpj_kegiatan.php";
  static String apiUploadLpjAnggaran = "$baseURL/LPJ/lpj_anggaran.php";
}
