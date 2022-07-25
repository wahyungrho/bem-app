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
  TextEditingController costRemainingController = TextEditingController();
  TextEditingController costRemainingDescriptionController =
      TextEditingController();
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
              keyboardType: TextInputType.number,
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
              onChanged: (value) {
                setState(() {
                  costRemainingController.text = (int.parse(
                              (costApproveController.text == ""
                                  ? "0"
                                  : costApproveController.text
                                      .replaceAll(',', ""))) -
                          int.parse((costUseController.text == ""
                              ? "0"
                              : costUseController.text.replaceAll(',', ""))))
                      .toString();
                });
              },
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
              keyboardType: TextInputType.number,
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
              onChanged: (value) {
                setState(() {
                  costRemainingController.text = (int.parse(
                              (costApproveController.text == ""
                                  ? "0"
                                  : costApproveController.text
                                      .replaceAll(',', ""))) -
                          int.parse((costUseController.text == ""
                              ? "0"
                              : costUseController.text.replaceAll(',', ""))))
                      .toString();
                });
              },
            ),
          ),
        ],
      );
    }

    Widget costRemainingTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sisa Anggaran",
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
                color: const Color(0xffe5e5e5)),
            child: TextField(
              controller: costRemainingController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyFormat()
              ],
              readOnly: true,
              style: mediumFontStyle.copyWith(color: blackColor),
              decoration: InputDecoration(
                hintStyle: mediumFontStyle.copyWith(color: blackColor),
                border: InputBorder.none,
                hintText: "Sisa Anggaran",
              ),
            ),
          ),
        ],
      );
    }

    Widget costRemainingDescription() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Keterangan Sisa Anggaran",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: costRemainingDescriptionController,
            keyboardType: TextInputType.multiline,
            style: mediumFontStyle.copyWith(color: greyColor),
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Keterangan Sisa Anggaran",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xffe5e5e5)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, color: Color(0xffe5e5e5)),
                  borderRadius: BorderRadius.circular(8),
                )),
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
                  } else if (costRemainingDescriptionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Please field Keterangan Sisa Anggaran not empty !"),
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
                        costRemainingController.text.replaceAll(",", ""),
                        costRemainingDescriptionController.text,
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Upload LPJ Anggaran"),
        ),
        body: ListView(
          padding: EdgeInsets.all(
            defaultMargin,
          ),
          children: [
            costApproveTextField(),
            const SizedBox(
              height: 20,
            ),
            costUseTextField(),
            const SizedBox(
              height: 20,
            ),
            costRemainingTextField(),
            const SizedBox(
              height: 20,
            ),
            costRemainingDescription(),
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
