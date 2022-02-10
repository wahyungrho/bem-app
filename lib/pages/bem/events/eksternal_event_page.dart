part of '../../pages.dart';

class EksternalEventPage extends StatefulWidget {
  const EksternalEventPage({Key? key}) : super(key: key);

  @override
  _EksternalEventPageState createState() => _EksternalEventPageState();
}

class _EksternalEventPageState extends State<EksternalEventPage> {
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
    var eventServices = Provider.of<EventServices>(context);
    return FutureBuilder<List<EventModel>>(
      future: eventServices.fetchEvent(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<EventModel> data = snapshot.data!
              .where((element) => (element.categoryEvent == 'Eksternal'))
              .toList();
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daftar Acara Eksternal",
                      style: boldFontStyle.copyWith(
                          fontSize: 18, color: blackColor),
                    ),
                    (roleID == '1')
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: mainColor),
                            onPressed: () {
                              Get.to(AddEvent(
                                onRefresh,
                                categoryEvent: 'Eksternal',
                              ));
                            },
                            child: const Text("Buat Agenda"))
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                    children: data
                        .map((e) => GestureDetector(
                              onTap: () {
                                Get.to(DetailEventPage(
                                  onRefresh,
                                  eventModel: e,
                                  roleID: roleID,
                                ));
                              },
                              child: InternalEventWidget(
                                eventModel: e,
                              ),
                            ))
                        .toList()),
                SizedBox(
                  height: defaultMargin,
                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator(color: mainColor));
        }
      },
    );
  }
}
