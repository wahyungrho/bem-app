part of '../../pages.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({Key? key}) : super(key: key);

  @override
  _ProposalPageState createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> {
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
                  .where((element) =>
                      element.statusUsulan == 'Usulan Diterima BEM')
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
                      "Pengajuan Proposal",
                      style: boldFontStyle.copyWith(
                          fontSize: 18, color: blackColor),
                    ),
                    Column(
                      children: dataTake
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Get.to(DetailUsulanPage(
                                    proposalModel: e,
                                    currentPage: 'proposal',
                                    title: 'Detail Proposal Program',
                                  ));
                                },
                                child: CardProposalWidget(
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
