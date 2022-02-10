part of '../../pages.dart';

class InternalEventPage extends StatefulWidget {
  const InternalEventPage({Key? key}) : super(key: key);

  @override
  _InternalEventPageState createState() => _InternalEventPageState();
}

class _InternalEventPageState extends State<InternalEventPage> {
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
              .where((element) => (element.categoryEvent == 'Internal'))
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
                      "Daftar Acara Internal",
                      style: boldFontStyle.copyWith(
                          fontSize: 18, color: blackColor),
                    ),
                    (roleID == '1')
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: mainColor),
                            onPressed: () {
                              Get.to(AddEvent(
                                onRefresh,
                                categoryEvent: 'Internal',
                              ));
                            },
                            child: const Text("Buat Agenda"))
                        : const SizedBox(),
                  ],
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
