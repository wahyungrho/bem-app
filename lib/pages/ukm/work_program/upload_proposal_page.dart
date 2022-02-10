part of '../../pages.dart';

class UploadProposalPage extends StatefulWidget {
  final ProposalModel? proposalModel;
  const UploadProposalPage({this.proposalModel, Key? key}) : super(key: key);

  @override
  _UploadProposalPageState createState() => _UploadProposalPageState();
}

class _UploadProposalPageState extends State<UploadProposalPage> {
  File? selectedFile;
  bool? isLoading = false;
  selectedFileAction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedFile = File(result.files.single.path!);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var proposalServices = Provider.of<ProposalServices>(context);
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
                    "Organisasi Acara :",
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
                    "Nama Program :",
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

    Widget uploadTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upload Proposal",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              selectedFileAction();
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                enabled: false,
                style: mediumFontStyle.copyWith(color: greyColor),
                decoration: InputDecoration(
                  icon: const SizedBox(
                      width: 26,
                      height: 26,
                      child: Icon(Icons.file_upload_rounded)),
                  hintText: selectedFile == null
                      ? "Upload proposal"
                      : path.basename(selectedFile!.path),
                  hintStyle: mediumFontStyle.copyWith(color: greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonActionProposal() {
      return Container(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  if (selectedFile == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please choose file !"),
                      backgroundColor: Color(0xffFF5677),
                    ));
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    Timer(const Duration(milliseconds: 3000), () async {
                      isLoading = false;
                      String? response = await proposalServices.uploadProposal(
                          widget.proposalModel!.prokerID, selectedFile);
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
                  }
                },
                child: (isLoading == false)
                    ? Text(
                        "Upload Proposal",
                        style: boldFontStyle,
                      )
                    : CircularProgressIndicator(
                        color: whiteColor,
                      )),
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          backgroundColor: mainColor, title: const Text("Upload Proposal")),
      body: Padding(
        padding: EdgeInsets.all(
          defaultMargin,
        ),
        child: Column(
          children: [
            detailNameOrmawa(widget.proposalModel!),
            detailTemaProgram(widget.proposalModel!),
            SizedBox(
              height: defaultMargin,
            ),
            uploadTextField(),
            buttonActionProposal(),
          ],
        ),
      ),
    );
  }
}
