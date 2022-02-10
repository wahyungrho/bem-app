part of '../../pages.dart';

class UpdateMeeting extends StatefulWidget {
  final MeetingModel? meetingModel;
  final VoidCallback method;
  const UpdateMeeting(this.method, {this.meetingModel, Key? key})
      : super(key: key);

  @override
  _UpdateMeetingState createState() => _UpdateMeetingState();
}

class _UpdateMeetingState extends State<UpdateMeeting> {
  bool? isLoading = false;
  TextEditingController temaController = TextEditingController();
  TextEditingController subtemaController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  DateTime? dateMeetingPicker;
  String? dateMeeting = "Tanggal rapat";
  String? selectedTime = "08.00";
  String? id = 'Id';

  getPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(UserPrefProfile.idUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreference();
    dateMeeting = widget.meetingModel!.date;
    selectedTime = widget.meetingModel!.time;
  }

  @override
  Widget build(BuildContext context) {
    var meetingServices = Provider.of<MeetingServices>(context);
    Widget temaTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pokok Pembahasan",
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
                hintText: widget.meetingModel!.tema,
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget subtemaTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sub Pokok Bahasan",
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
              controller: subtemaController,
              maxLines: 3,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: widget.meetingModel!.subtema,
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget dateMeetings() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Rapat",
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
                dateMeetingPicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030));

                dateMeeting = DateFormat('y-M-d').format(dateMeetingPicker!);
                setState(() {});
              },
              child: TextField(
                style: mediumFontStyle.copyWith(color: greyColor),
                enabled: false,
                decoration: InputDecoration(
                  hintText: dateMeeting,
                  hintStyle: mediumFontStyle.copyWith(color: greyColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget timeMeetings() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Waktu Rapat",
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
                final TimeOfDay? time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (time != null) {
                  selectedTime = time.format(context);
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

    Widget lokasiTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lokasi Rapat",
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
              controller: lokasiController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: widget.meetingModel!.location,
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
              setState(() {
                isLoading = true;
              });

              Timer(const Duration(milliseconds: 3000), () async {
                isLoading = false;

                String? response = await meetingServices.updateMeeting(
                    widget.meetingModel!.id,
                    (temaController.text.isEmpty)
                        ? widget.meetingModel!.tema
                        : temaController.text,
                    (subtemaController.text.isEmpty)
                        ? widget.meetingModel!.subtema
                        : subtemaController.text,
                    dateMeeting,
                    selectedTime,
                    (lokasiController.text.isEmpty)
                        ? widget.meetingModel!.location
                        : lokasiController.text);
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
                    widget.method();
                    Get.back();
                    setState(() {});
                  });
                }

                setState(() {});
              });
            },
            child: (isLoading == false)
                ? Text(
                    "Ubah Data",
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
                "Mengubah data rapat?\nSilahkan isi field dibawah ini",
                style: boldFontStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              temaTextField(),
              const SizedBox(
                height: 20,
              ),
              subtemaTextField(),
              const SizedBox(
                height: 20,
              ),
              dateMeetings(),
              const SizedBox(
                height: 20,
              ),
              timeMeetings(),
              const SizedBox(
                height: 20,
              ),
              lokasiTextField(),
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
      )),
    );
  }
}
