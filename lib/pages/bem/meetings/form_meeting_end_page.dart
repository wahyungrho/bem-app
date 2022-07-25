part of '../../pages.dart';

class FormMeetingEndPage extends StatefulWidget {
  final MeetingModel meetingModel;
  const FormMeetingEndPage({Key? key, required this.meetingModel})
      : super(key: key);

  @override
  State<FormMeetingEndPage> createState() => _FormMeetingEndPageState();
}

class _FormMeetingEndPageState extends State<FormMeetingEndPage> {
  TextEditingController temaController = TextEditingController();
  TextEditingController pimpinanController = TextEditingController();
  TextEditingController hadirController = TextEditingController();
  TextEditingController notulenController = TextEditingController();
  bool isLoadingBtn = false;

  Future<void> addNotulen() async {
    setState(() {
      isLoadingBtn = true;
    });
    var response = await http.post(Uri.parse(BASEURL.addNotulen), body: {
      'meetingID': widget.meetingModel.id,
      'jumlah_kehadiran': hadirController.text,
      'pimpinan_rapat': pimpinanController.text,
      'notulen_content': notulenController.text
    });
    var data = jsonDecode(response.body);
    setState(() {
      isLoadingBtn = true;
    });
    if (data['value'] == 1) {
      Get.offAll(const MainPage(
        currentPage: DrawerSections.notula,
      ));
      var snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(data['message']),
        backgroundColor: mainColor,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      var snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(data['message']),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
  }

  void validation() {
    if (pimpinanController.text.isEmpty ||
        hadirController.text.isEmpty ||
        notulenController.text.isEmpty) {
      var snackBar = const SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Field tidak boleh kosong"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else {
      addNotulen();
    }
  }

  @override
  void dispose() {
    temaController.dispose();
    pimpinanController.dispose();
    hadirController.dispose();
    notulenController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    temaController.text = widget.meetingModel.tema!;
  }

  @override
  Widget build(BuildContext context) {
    Widget temaMeeting() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tema Pembahasan",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: temaController,
              readOnly: true,
              style: mediumFontStyle.copyWith(color: blackColor),
              decoration: InputDecoration(
                hintText: "Tema Pembahasan",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget pemimpinRapat() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pimpinan Rapat",
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
              controller: pimpinanController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Pimpinan Rapat",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget jumlahAnggotaHadir() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jumlah Kehadiran",
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
              controller: hadirController,
              keyboardType: TextInputType.number,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Jumlah Kehadiran",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ],
      );
    }

    Widget contentNotula() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ringkasan Pembahasan Rapat",
            style: boldFontStyle.copyWith(color: blackColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: notulenController,
            keyboardType: TextInputType.multiline,
            style: mediumFontStyle.copyWith(color: greyColor),
            maxLines: null,
            decoration: InputDecoration(
                hintText: "Ringkasan Pembahasan Rapat",
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notulen Rapat",
          ),
          backgroundColor: mainColor,
        ),
        body: ListView(padding: EdgeInsets.all(defaultMargin), children: [
          temaMeeting(),
          const SizedBox(
            height: 15,
          ),
          pemimpinRapat(),
          const SizedBox(
            height: 15,
          ),
          jumlahAnggotaHadir(),
          const SizedBox(
            height: 15,
          ),
          contentNotula(),
          SizedBox(
            height: defaultMargin - 5,
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  validation();
                },
                style: ElevatedButton.styleFrom(primary: mainColor),
                child: (isLoadingBtn)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text("Simpan Notulen", style: mediumFontStyle)),
          )
        ]),
      ),
    );
  }
}
