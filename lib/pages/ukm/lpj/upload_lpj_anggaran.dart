part of '../../pages.dart';

class UploadLPJAnggaran extends StatefulWidget {
  final ProposalModel? proposalModel;
  const UploadLPJAnggaran({this.proposalModel, Key? key}) : super(key: key);

  @override
  _UploadLPJAnggaranState createState() => _UploadLPJAnggaranState();
}

class _UploadLPJAnggaranState extends State<UploadLPJAnggaran> {
  File? selectedFile;
  bool? isLoading = false;
  TextEditingController costApproveController = TextEditingController();
  TextEditingController costUseController = TextEditingController();
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
    var lpjServices = Provider.of<LPJServices>(context);

    Widget costApproveTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biaya Yang Disetujui",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: costApproveController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyFormat()
              ],
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Biaya yang disetujui",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget costUseTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biaya Yang Digunakan",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: costUseController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyFormat()
              ],
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Biaya yang digunakan",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget uploadTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upload LPJ Anggaran",
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
                      ? "Upload LPJ Anggaran"
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

    Widget buttonActionUploadLPJAnggaran() {
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
                  } else if (costApproveController.text.isEmpty ||
                      costUseController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please field not empty !"),
                      backgroundColor: Color(0xffFF5677),
                    ));
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    Timer(const Duration(milliseconds: 3000), () async {
                      isLoading = false;
                      String? response = await lpjServices.uploadLPJCost(
                        widget.proposalModel!.prokerID,
                        selectedFile,
                        costApproveController.text.replaceAll(",", ""),
                        costUseController.text.replaceAll(",", ""),
                      );
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
                        "Upload LPJ Anggaran",
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
        backgroundColor: mainColor,
        title: const Text("Upload LPJ Anggaran"),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          defaultMargin,
        ),
        child: Column(
          children: [
            costApproveTextField(),
            const SizedBox(
              height: 20,
            ),
            costUseTextField(),
            const SizedBox(
              height: 20,
            ),
            uploadTextField(),
            const SizedBox(
              height: 20,
            ),
            buttonActionUploadLPJAnggaran(),
          ],
        ),
      ),
    );
  }
}
