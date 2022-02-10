part of '../../pages.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  Future<void> onRefresh() async {
    return getPreference();
  }

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
    var meetingServices = Provider.of<MeetingServices>(context);
    return FutureBuilder<List<MeetingModel>>(
        future: meetingServices.fetchMeeting(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<MeetingModel> data = snapshot.data!.take(5).toList();
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daftar Rapat BEM",
                        style: boldFontStyle.copyWith(
                            fontSize: 18, color: blackColor),
                      ),
                      (roleID == '1')
                          ? ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: mainColor),
                              onPressed: () {
                                Get.to(const AddMeeting());
                              },
                              child: const Text("Buat Rapat"))
                          : const SizedBox(),
                    ],
                  ),
                  Column(
                    children: data
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Get.to(DetailMeetingPage(
                                method: onRefresh,
                                meetingModel: e,
                                roleID: roleID,
                              ));
                            },
                            child: MeetingCardWidget(
                              meetingModel: e,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(color: mainColor));
          }
        });
  }
}
