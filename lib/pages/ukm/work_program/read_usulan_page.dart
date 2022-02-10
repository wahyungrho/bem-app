part of '../../pages.dart';

class ListProkerPage extends StatefulWidget {
  const ListProkerPage({Key? key}) : super(key: key);

  @override
  _ListProkerPageState createState() => _ListProkerPageState();
}

class _ListProkerPageState extends State<ListProkerPage> {
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
    var proposalServices = Provider.of<ProposalServices>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: FutureBuilder<List<ProposalModel>>(
          future: proposalServices.fetchUsulanProker(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<ProposalModel> data = snapshot.data!.take(5).toList();
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
                          "Program Kerja",
                          style: boldFontStyle.copyWith(
                              fontSize: 18, color: blackColor),
                        ),
                        (roleID == '2' || roleID == '3')
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: mainColor),
                                onPressed: () {
                                  Get.to(const AddProkerPage());
                                },
                                child: const Text("Program Kerja Baru"))
                            : const SizedBox(),
                      ],
                    ),
                    Column(
                      children: data
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Get.to(DetailUsulanPage(
                                    proposalModel: e,
                                    currentPage: 'usulan',
                                    title: 'Detail Usulan Program',
                                  ));
                                },
                                child: CardUsulanWidget(
                                  proposalModel: e,
                                ),
                              ))
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
          }),
    );
  }
}
