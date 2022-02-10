part of '../../pages.dart';

class AddProkerPage extends StatefulWidget {
  const AddProkerPage({Key? key}) : super(key: key);

  @override
  _AddProkerPageState createState() => _AddProkerPageState();
}

class _AddProkerPageState extends State<AddProkerPage> {
  bool? isLoading = false;
  DateTime? dateProkersPicker;
  TimeOfDay? time;
  String? organizedBy = "2";
  String? dateProkers = "Tanggal agenda";
  String? selectedTime = "Waktu agenda";
  String? id = 'Id';
  TextEditingController temaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(UserPrefProfile.idUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  _showDialogAdd(Function? function) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Informasi !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu yakin untuk mengajukan usulan ?'),
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
  Widget build(BuildContext context) {
    var staffServices = Provider.of<StaffServices>(context);
    var proposalServices = Provider.of<ProposalServices>(context);

    Widget organizedByTextField() {
      return FutureBuilder<List<OrmawaModel>>(
          future: staffServices.fetchListOrmawa(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              List<OrmawaModel> data = snapshot.data!
                  .where((element) => element.ormawa != 'Admin')
                  .toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Organisasi Acara :",
                    style:
                        boldFontStyle.copyWith(fontSize: 16, color: blackColor),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      value: organizedBy,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: data.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.ormawa!),
                          value: e.id,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          organizedBy = newValue.toString();
                        });
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          });
    }

    Widget temaTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tema Acara",
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
              controller: temaController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Tema acara",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget descriptionTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deskripsi Acara",
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
              textInputAction: TextInputAction.done,
              controller: descriptionController,
              maxLines: 3,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Deskripsi acara",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget dateProker() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Acara",
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
            child: GestureDetector(
              onTap: () async {
                dateProkersPicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030));

                if (dateProkersPicker != null) {
                  dateProkers = DateFormat('y-M-d').format(dateProkersPicker!);
                  setState(() {});
                }
              },
              child: TextField(
                style: mediumFontStyle.copyWith(color: greyColor),
                enabled: false,
                decoration: InputDecoration(
                  hintText: dateProkers,
                  hintStyle: mediumFontStyle.copyWith(color: greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget timeProker() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Waktu Acara",
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
            child: GestureDetector(
              onTap: () async {
                time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (time != null) {
                  selectedTime = time!.format(context);
                  setState(() {});
                }
              },
              child: TextField(
                style: mediumFontStyle.copyWith(color: greyColor),
                enabled: false,
                decoration: InputDecoration(
                  hintText: selectedTime,
                  hintStyle: mediumFontStyle.copyWith(color: greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget costTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Biaya Acara",
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
              controller: costController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyFormat()
              ],
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Biaya acara",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget locationTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lokasi Acara",
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
              controller: locationController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Lokasi acara",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSubmit() {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: mainColor),
            onPressed: () {
              _showDialogAdd(() {
                setState(() {
                  isLoading = true;
                });

                Timer(const Duration(milliseconds: 3000), () async {
                  isLoading = false;
                  if (temaController.text.isEmpty ||
                      descriptionController.text.isEmpty ||
                      costController.text.isEmpty ||
                      locationController.text.isEmpty ||
                      dateProkersPicker == null ||
                      time == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please complete the fields !"),
                      backgroundColor: Color(0xffFF5677),
                    ));
                  } else {
                    String? response = await proposalServices.addUsulanProker(
                      organizedBy,
                      temaController.text,
                      descriptionController.text,
                      dateProkers,
                      selectedTime,
                      costController.text.replaceAll(",", ""),
                      locationController.text,
                      id,
                    );
                    if (response == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Oops, add data failed! please try again ..."),
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
                  }
                  setState(() {});
                });
              });
            },
            child: (isLoading == false)
                ? Text(
                    "Tambahkan",
                    style: boldFontStyle,
                  )
                : CircularProgressIndicator(
                    color: whiteColor,
                  )),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Tambahkan Program Kerja?\nSilahkan isi field dibawah ini",
                  style: boldFontStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                organizedByTextField(),
                const SizedBox(
                  height: 20,
                ),
                temaTextField(),
                const SizedBox(
                  height: 20,
                ),
                descriptionTextField(),
                const SizedBox(
                  height: 20,
                ),
                dateProker(),
                const SizedBox(
                  height: 20,
                ),
                timeProker(),
                const SizedBox(
                  height: 20,
                ),
                costTextField(),
                const SizedBox(
                  height: 20,
                ),
                locationTextField(),
                const SizedBox(
                  height: 40,
                ),
                buttonSubmit(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrencyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text);
    final money = NumberFormat("###,###,###", "en_us");

    String newText = money.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
