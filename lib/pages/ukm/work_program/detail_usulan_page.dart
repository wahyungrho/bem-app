part of '../../pages.dart';

class DetailUsulanPage extends StatefulWidget {
  final ProposalModel? proposalModel;
  final String? currentPage;
  final String? title;
  const DetailUsulanPage(
      {this.proposalModel, this.currentPage, this.title, Key? key})
      : super(key: key);

  @override
  _DetailUsulanPageState createState() => _DetailUsulanPageState();
}

class _DetailUsulanPageState extends State<DetailUsulanPage> {
  TextEditingController remarkController = TextEditingController();
  bool isLoading = false;
  bool isLoading1 = false;
  bool isLoading2 = false;

  String roleID = 'id';

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    roleID = sharedPreferences.getString(UserPrefProfile.idRole)!;
    setState(() {});
  }

  _showDialogUsulan(Function? function, String? text) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Informasi !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text!),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xffFF5677)),
                    side: MaterialStateProperty.resolveWith((states) =>
                        const BorderSide(width: 1, color: Color(0xffFF5677)))),
                child: const Text('Tidak'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateColor.resolveWith((states) => whiteColor),
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => mainColor)),
                child: const Text('Iya'),
                onPressed: () {
                  function!();
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    var proposalServices = Provider.of<ProposalServices>(context);
    Widget detailItemFullname(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username Pengusul Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.fullname!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailNameOrmawa(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Organisasi Pengusul Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.nameOrmawa!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailTemaProgram(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tema Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.tema!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailDescriptionProgram(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 70,
                    child: Text(
                      text.description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: boldFontStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailDateTimeProgram(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Waktu Pelaksanaan Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat('E').format(DateTime.parse(text.date!)) +
                        ', ${text.date} | ' +
                        text.time!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailCostProgram(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biaya Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ')
                        .format(int.parse("${text.biaya}")),
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailLocationProgram(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lokasi Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.location!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailNotedUsulan(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Catatan Usulan Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.noteUsulan!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailStatusUsulan(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status Usulan Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.statusUsulan!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailNotedProposal(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Catatan Proposal Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.noteProposal!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailStatusProposal(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status Proposal Program :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.statusProposal!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailFileProposal(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Proposal Program (PDF) :",
                        style: mediumFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      (text.pathFile! != '-')
                          ? GestureDetector(
                              onTap: () {
                                final Uri url = Uri.parse(
                                    BASEURL.apiViewProposal + text.pathFile!);
                                // Get.to(WebViewProposal(
                                //   pathProposal: text.pathFile!,
                                // ));
                                launch(url.toString());
                              },
                              child: Text(
                                "Lihat Proposal",
                                style: mediumFontStyle.copyWith(
                                    fontSize: 16, color: mainColor),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.pathFile!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget catatanSubmitUsulan() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Catatan Tambahan Usulan Program",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: remarkController,
              maxLines: 3,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Catatan usulan program",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget detailCostApprove(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biaya disetujui :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    (text.costApprove == "-")
                        ? text.costApprove!
                        : NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'Rp ')
                            .format(int.parse("${text.costApprove}")),
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailCostUse(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biaya Yang Digunakan :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    (text.costUse == "-")
                        ? text.costUse!
                        : NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: 'Rp ')
                            .format(int.parse("${text.costUse}")),
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailFileEvent(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LPJ Kegiatan (PDF) :",
                        style: mediumFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      (text.pathFileEvent! != '-')
                          ? GestureDetector(
                              onTap: () {
                                final Uri url = Uri.parse(
                                    BASEURL.apiViewLpjKegiatan +
                                        text.pathFileEvent!);
                                launch(url.toString());
                              },
                              child: Text(
                                "Lihat LPJ",
                                style: mediumFontStyle.copyWith(
                                    fontSize: 16, color: mainColor),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.pathFileEvent!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget detailFileCost(ProposalModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: mainColor,
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LPJ Anggaran (PDF) :",
                        style: mediumFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      (text.pathFileCost! != '-')
                          ? GestureDetector(
                              onTap: () {
                                final Uri url = Uri.parse(
                                    BASEURL.apiViewLpjAnggaran +
                                        text.pathFileCost!);
                                launch(url.toString());
                              },
                              child: Text(
                                "Lihat LPJ",
                                style: mediumFontStyle.copyWith(
                                    fontSize: 16, color: mainColor),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.pathFileCost!,
                    style: boldFontStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonAction() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1, color: const Color(0xffFF5677))),
                child: ElevatedButton(
                    onPressed: () {
                      if (remarkController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Please complete the fields 'Catatan Tambahan' !"),
                          backgroundColor: Color(0xffFF5677),
                        ));
                      } else {
                        _showDialogUsulan(() {
                          setState(() {
                            isLoading = true;
                          });

                          Timer(const Duration(milliseconds: 3000), () async {
                            isLoading = false;
                            String? response =
                                await proposalServices.updateUsulanFromBem(
                                    widget.proposalModel!.prokerID,
                                    remarkController.text,
                                    'Tolak');
                            if (response == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Oops, add data failed! please try again ..."),
                                backgroundColor: Color(0xffFF5677),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  response,
                                  style:
                                      boldFontStyle.copyWith(color: whiteColor),
                                ),
                                backgroundColor: const Color(0xff7CD1B8),
                                duration: const Duration(milliseconds: 1500),
                              ));
                              Timer(const Duration(milliseconds: 2500), () {
                                // widget.method();
                                Get.back();
                              });
                            }
                            setState(() {});
                          });
                        }, 'Apakah kamu yakin menolak usulan program ini ?');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: const Color(0xffFF5677)),
                    child: (isLoading == false)
                        ? Text(
                            "Tolak",
                            style: boldFontStyle,
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xffFF5677),
                          )),
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                    onPressed: () {
                      _showDialogUsulan(() {
                        setState(() {
                          isLoading1 = true;
                        });

                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading1 = false;
                          String? response =
                              await proposalServices.updateUsulanFromBem(
                                  widget.proposalModel!.prokerID,
                                  (remarkController.text.isEmpty)
                                      ? widget.proposalModel!.noteUsulan
                                      : remarkController.text,
                                  'Terima');
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Oops, add data failed! please try again ..."),
                              backgroundColor: Color(0xffFF5677),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                response,
                                style:
                                    boldFontStyle.copyWith(color: whiteColor),
                              ),
                              backgroundColor: const Color(0xff7CD1B8),
                              duration: const Duration(milliseconds: 1500),
                            ));
                            Timer(const Duration(milliseconds: 2500), () {
                              // widget.method();
                              Get.back();
                            });
                          }
                          setState(() {});
                        });
                      }, 'Apakah kamu yakin menerima usulan program ini ?');
                    },
                    child: (isLoading1 == false)
                        ? Text(
                            "Terima",
                            style: boldFontStyle,
                          )
                        : CircularProgressIndicator(
                            color: whiteColor,
                          )),
              ),
            ],
          ));
    }

    Widget buttonActionDelete() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xffFF5677)),
                onPressed: () {
                  _showDialogUsulan(() {
                    setState(() {
                      isLoading2 = true;
                    });

                    Timer(const Duration(milliseconds: 3000), () async {
                      isLoading2 = false;
                      String? response = await proposalServices
                          .deleteUsulanProker(widget.proposalModel!.prokerID);
                      if (response == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Oops, delete data failed! please try again ..."),
                          backgroundColor: Color(0xffFF5677),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            response,
                            style: boldFontStyle.copyWith(color: whiteColor),
                          ),
                          backgroundColor: const Color(0xff7CD1B8),
                          duration: const Duration(milliseconds: 1500),
                        ));
                        Timer(const Duration(milliseconds: 2500), () {
                          // widget.method();
                          Get.back();
                        });
                      }
                      setState(() {});
                    });
                  }, 'Apakah kamu yakin menghapus usulan program ini ?');
                },
                child: (isLoading2 == false)
                    ? Text(
                        "Delete Usulan Program",
                        style: boldFontStyle,
                      )
                    : CircularProgressIndicator(
                        color: whiteColor,
                      )),
          ));
    }

    Widget buttonActionProposal() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(UploadProposalPage(
                    proposalModel: widget.proposalModel,
                  ));
                },
                child: (isLoading1 == false)
                    ? Text(
                        "Upload Proposal",
                        style: boldFontStyle,
                      )
                    : CircularProgressIndicator(
                        color: whiteColor,
                      )),
          ));
    }

    Widget buttonActionBEM() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1, color: const Color(0xffFF5677))),
                child: ElevatedButton(
                    onPressed: () {
                      _showDialogUsulan(() {
                        setState(() {
                          isLoading = true;
                        });

                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading = false;
                          String? response =
                              await proposalServices.updateStatusProposal(
                                  widget.proposalModel!.prokerID,
                                  widget.proposalModel!.noteProposal,
                                  'Tolak',
                                  'BEM');
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Oops, add data failed! please try again ..."),
                              backgroundColor: Color(0xffFF5677),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                response,
                                style:
                                    boldFontStyle.copyWith(color: whiteColor),
                              ),
                              backgroundColor: const Color(0xff7CD1B8),
                              duration: const Duration(milliseconds: 1500),
                            ));
                            Timer(const Duration(milliseconds: 2500), () {
                              // widget.method();
                              Get.back();
                            });
                          }
                          setState(() {});
                        });
                      }, 'Apakah kamu yakin menolak usulan program ini ?');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: const Color(0xffFF5677)),
                    child: (isLoading == false)
                        ? Text(
                            "Tolak",
                            style: boldFontStyle,
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xffFF5677),
                          )),
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                    onPressed: () {
                      _showDialogUsulan(() {
                        setState(() {
                          isLoading1 = true;
                        });

                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading1 = false;
                          String? response =
                              await proposalServices.updateStatusProposal(
                                  widget.proposalModel!.prokerID,
                                  widget.proposalModel!.noteProposal,
                                  'Terima',
                                  'BEM');
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Oops, add data failed! please try again ..."),
                              backgroundColor: Color(0xffFF5677),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                response,
                                style:
                                    boldFontStyle.copyWith(color: whiteColor),
                              ),
                              backgroundColor: const Color(0xff7CD1B8),
                              duration: const Duration(milliseconds: 1500),
                            ));
                            Timer(const Duration(milliseconds: 2500), () {
                              // widget.method();
                              Get.back();
                            });
                          }
                          setState(() {});
                        });
                      }, 'Apakah kamu yakin menerima proposal program ini ?');
                    },
                    child: (isLoading1 == false)
                        ? Text(
                            "Terima",
                            style: boldFontStyle,
                          )
                        : CircularProgressIndicator(
                            color: whiteColor,
                          )),
              ),
            ],
          ));
    }

    Widget buttonActionMPM() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1, color: const Color(0xffFF5677))),
                child: ElevatedButton(
                    onPressed: () {
                      if (remarkController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Please complete the fields 'Catatan Tambahan' !"),
                          backgroundColor: Color(0xffFF5677),
                        ));
                      } else {
                        _showDialogUsulan(() {
                          setState(() {
                            isLoading = true;
                          });

                          Timer(const Duration(milliseconds: 3000), () async {
                            isLoading = false;
                            String? response =
                                await proposalServices.updateStatusProposal(
                                    widget.proposalModel!.prokerID,
                                    remarkController.text,
                                    'Tolak',
                                    'MPM/DPM');
                            if (response == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Oops, add data failed! please try again ..."),
                                backgroundColor: Color(0xffFF5677),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  response,
                                  style:
                                      boldFontStyle.copyWith(color: whiteColor),
                                ),
                                backgroundColor: const Color(0xff7CD1B8),
                                duration: const Duration(milliseconds: 1500),
                              ));
                              Timer(const Duration(milliseconds: 2500), () {
                                // widget.method();
                                Get.back();
                              });
                            }
                            setState(() {});
                          });
                        }, 'Apakah kamu yakin menolak usulan program ini ?');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: const Color(0xffFF5677)),
                    child: (isLoading == false)
                        ? Text(
                            "Tolak",
                            style: boldFontStyle,
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xffFF5677),
                          )),
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                    onPressed: () {
                      _showDialogUsulan(() {
                        setState(() {
                          isLoading1 = true;
                        });

                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading1 = false;
                          String? response =
                              await proposalServices.updateStatusProposal(
                                  widget.proposalModel!.prokerID,
                                  (remarkController.text.isEmpty)
                                      ? widget.proposalModel!.noteProposal
                                      : remarkController.text,
                                  'Terima',
                                  'MPM/DPM');
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Oops, add data failed! please try again ..."),
                              backgroundColor: Color(0xffFF5677),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                response,
                                style:
                                    boldFontStyle.copyWith(color: whiteColor),
                              ),
                              backgroundColor: const Color(0xff7CD1B8),
                              duration: const Duration(milliseconds: 1500),
                            ));
                            Timer(const Duration(milliseconds: 2500), () {
                              // widget.method();
                              Get.back();
                            });
                          }
                          setState(() {});
                        });
                      }, 'Apakah kamu yakin menerima proposal program ini ?');
                    },
                    child: (isLoading1 == false)
                        ? Text(
                            "Terima",
                            style: boldFontStyle,
                          )
                        : CircularProgressIndicator(
                            color: whiteColor,
                          )),
              ),
            ],
          ));
    }

    Widget buttonActionLPJ() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: Column(
            children: [
              (widget.proposalModel!.pathFileEvent == '-')
                  ? SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(UploadLPJKegiatan(
                              proposalModel: widget.proposalModel,
                            ));
                          },
                          child: Text(
                            "Upload LPJ Kegiatan",
                            style: boldFontStyle,
                          )),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              (widget.proposalModel!.pathFileCost == '-')
                  ? SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.amber, onPrimary: blackColor),
                          onPressed: () {
                            Get.to(UploadLPJAnggaran(
                              proposalModel: widget.proposalModel,
                            ));
                          },
                          child: Text(
                            "Upload LPJ Anggaran",
                            style: boldFontStyle,
                          )))
                  : const SizedBox(),
            ],
          ));
    }

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(widget.title!),
        ),
        body: ListView(
          padding: EdgeInsets.all(defaultMargin),
          children: [
            detailItemFullname(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailNameOrmawa(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailTemaProgram(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailDescriptionProgram(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailDateTimeProgram(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailCostProgram(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailLocationProgram(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailNotedUsulan(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailStatusUsulan(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailNotedProposal(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailStatusProposal(widget.proposalModel!),
            const SizedBox(
              height: 14,
            ),
            detailFileProposal(widget.proposalModel!),
            (widget.proposalModel!.statusUsulan == 'Usulan Baru' &&
                    widget.currentPage == 'usulan' &&
                    roleID == '1')
                ? Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      catatanSubmitUsulan(),
                      const SizedBox(
                        height: 30,
                      ),
                      buttonAction(),
                      buttonActionDelete(),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                : (widget.proposalModel!.statusProposal == 'Usulan Baru' &&
                        widget.currentPage == 'proposal' &&
                        widget.proposalModel!.pathFile == '-' &&
                        roleID != '1' &&
                        roleID != '4')
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          buttonActionProposal(),
                        ],
                      )
                    : (widget.proposalModel!.statusProposal == 'Usulan Baru' &&
                            widget.currentPage == 'proposal' &&
                            widget.proposalModel!.pathFile != '-' &&
                            roleID == '1')
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              buttonActionBEM(),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        : (widget.proposalModel!.statusProposal ==
                                    'Proposal Diterima BEM' &&
                                widget.currentPage == 'proposal' &&
                                widget.proposalModel!.pathFile != '-' &&
                                roleID == '4')
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  catatanSubmitUsulan(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  buttonActionMPM(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )
                            : (widget.proposalModel!.statusEvent! ==
                                        'Selesai' &&
                                    widget.currentPage == 'lpj')
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      detailCostApprove(widget.proposalModel!),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      detailCostUse(widget.proposalModel!),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      detailFileEvent(widget.proposalModel!),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      detailFileCost(widget.proposalModel!),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      (roleID == '2' || roleID == '2')
                                          ? buttonActionLPJ()
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
          ],
        ));
  }
}
