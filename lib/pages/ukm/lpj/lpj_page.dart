part of '../../pages.dart';

class LPJPage extends StatefulWidget {
  const LPJPage({Key? key}) : super(key: key);

  @override
  _LPJPageState createState() => _LPJPageState();
}

class _LPJPageState extends State<LPJPage> {
  Future<void> onRefresh() async {
    return setState(() {});
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
              List<ProposalModel> data = snapshot.data!
                  .where((element) => element.statusEvent == 'Selesai')
                  .toList();
              List<ProposalModel> dataTake = data.take(5).toList();
              return RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Dokumen LPJ",
                      style: boldFontStyle.copyWith(
                          fontSize: 18, color: blackColor),
                    ),
                    Column(
                      children: dataTake
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Get.to(DetailUsulanPage(
                                    proposalModel: e,
                                    currentPage: 'lpj',
                                    title: 'Detail LPJ Program',
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
