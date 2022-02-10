import 'package:app_bem/models/models.dart';
import 'package:app_bem/pages/pages.dart';
import 'package:app_bem/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DrawerSections {
  home,
  staff,
  users,
  meetings,
  internalEvents,
  externalEvents,
  proker,
  proposal,
  lpjReport,
  profile,
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage = DrawerSections.home;

  String roleID = 'id';

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    roleID = sharedPreferences.getString(UserPrefProfile.idRole)!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    Widget menuItem(int id, String text, IconData icon, bool selected) {
      return Material(
        color: selected ? mainColor.withOpacity(0.3) : Colors.transparent,
        child: InkWell(
            onTap: () {
              Get.back();
              setState(() {
                switch (id) {
                  case 1:
                    currentPage = DrawerSections.home;
                    break;
                  case 2:
                    currentPage = DrawerSections.staff;
                    break;
                  case 3:
                    currentPage = DrawerSections.users;
                    break;
                  case 4:
                    currentPage = DrawerSections.meetings;
                    break;
                  case 5:
                    currentPage = DrawerSections.internalEvents;
                    break;
                  case 6:
                    currentPage = DrawerSections.externalEvents;
                    break;
                  case 7:
                    currentPage = DrawerSections.proker;
                    break;
                  case 8:
                    currentPage = DrawerSections.proposal;
                    break;
                  case 9:
                    currentPage = DrawerSections.lpjReport;
                    break;
                  case 10:
                    currentPage = DrawerSections.profile;
                    break;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    icon,
                    size: 20,
                    color: blackColor,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        text,
                        style: regulerFontStyle.copyWith(
                            color: blackColor, fontSize: 16),
                      )),
                ],
              ),
            )),
      );
    }

    Widget myDrawerList() {
      return Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            menuItem(1, "Beranda", Icons.home_outlined,
                currentPage == DrawerSections.home ? true : false),
            (roleID == '1')
                ? menuItem(2, "Daftar Anggota", Icons.group_outlined,
                    currentPage == DrawerSections.staff ? true : false)
                : const SizedBox(),
            (roleID == '1')
                ? menuItem(3, "Daftar Pengguna", Icons.assignment_ind_outlined,
                    currentPage == DrawerSections.users ? true : false)
                : const SizedBox(),
            const Divider(
              thickness: 1,
            ),
            (roleID == '1' || roleID == '2')
                ? menuItem(4, "Jadwal Rapat", Icons.assignment_outlined,
                    currentPage == DrawerSections.meetings ? true : false)
                : const SizedBox(),
            menuItem(5, "Kegiatan Internal", Icons.event_available_outlined,
                currentPage == DrawerSections.internalEvents ? true : false),
            (roleID == '1' || roleID == '2')
                ? menuItem(6, "Kegiatan Eksternal", Icons.event_note_outlined,
                    currentPage == DrawerSections.externalEvents ? true : false)
                : const SizedBox(),
            const Divider(
              thickness: 1,
            ),
            menuItem(7, "Usulan Program", Icons.file_copy_outlined,
                currentPage == DrawerSections.proker ? true : false),
            menuItem(8, "Pengajuan Proposal", Icons.file_copy_outlined,
                currentPage == DrawerSections.proposal ? true : false),
            menuItem(9, "Dokumen LPJ", Icons.upload_file_outlined,
                currentPage == DrawerSections.lpjReport ? true : false),
            const Divider(
              thickness: 1,
            ),
            menuItem(10, "Profil Saya", Icons.person_outline_rounded,
                currentPage == DrawerSections.profile ? true : false),
          ],
        ),
      );
    }

    Widget? container;
    if (currentPage == DrawerSections.home) {
      container = const HomePage();
      setState(() {});
    } else if (currentPage == DrawerSections.staff) {
      container = const StaffPage();
      setState(() {});
    } else if (currentPage == DrawerSections.users) {
      container = const UserPage();
      setState(() {});
    } else if (currentPage == DrawerSections.meetings) {
      container = const MeetingPage();
      setState(() {});
    } else if (currentPage == DrawerSections.internalEvents) {
      container = const InternalEventPage();
      setState(() {});
    } else if (currentPage == DrawerSections.externalEvents) {
      container = const EksternalEventPage();
      setState(() {});
    } else if (currentPage == DrawerSections.proker) {
      container = const ListProkerPage();
      setState(() {});
    } else if (currentPage == DrawerSections.proposal) {
      container = const ProposalPage();
      setState(() {});
    } else if (currentPage == DrawerSections.lpjReport) {
      container = const LPJPage();
      setState(() {});
    } else if (currentPage == DrawerSections.profile) {
      container = const ProfilePage();
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Badan Eksekutif Mahasiswa",
          style: mediumFontStyle,
        ),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: SizedBox(
              child: Column(
            children: [
              const MyHeaderDrawer(),
              myDrawerList(),
            ],
          )),
        ),
      ),
    );
  }
}

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? fullname;
  String? email;
  Future<void> getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fullname = sharedPreferences.getString(UserPrefProfile.fullname);
    email = sharedPreferences.getString(UserPrefProfile.email);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fullname.toString(),
            style: boldFontStyle.copyWith(color: whiteColor, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            email.toString(),
            style: mediumFontStyle.copyWith(
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
