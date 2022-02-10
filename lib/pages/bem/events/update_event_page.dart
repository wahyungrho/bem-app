part of '../../pages.dart';

class UpdateEvent extends StatefulWidget {
  final EventModel? eventModel;
  final VoidCallback method;
  const UpdateEvent(this.method, {this.eventModel, Key? key}) : super(key: key);

  @override
  _UpdateEventState createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  String? organizedBy = "2";
  String? eventCategory = '';
  DateTime? dateMeetingPicker;
  String? dateMeeting = "Tanggal agenda";
  String? selectedTime = "Waktu agenda";
  bool? isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateMeeting = widget.eventModel!.date!;
    selectedTime = widget.eventModel!.time!;
  }

  @override
  Widget build(BuildContext context) {
    var eventServices = Provider.of<EventServices>(context);

    Widget titleTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Judul Agenda",
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
              controller: titleController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: widget.eventModel!.title!,
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
            "Deskripsi Agenda",
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
              controller: descriptionController,
              style: mediumFontStyle.copyWith(color: greyColor),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: widget.eventModel!.description!,
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    // Widget organizedByTextField() {
    //   return FutureBuilder<List<OrmawaModel>>(
    //       future: staffServices.fetchListOrmawa(),
    //       builder: (_, snapshot) {
    //         if (snapshot.hasData) {
    //           List<OrmawaModel> data = snapshot.data!
    //               .where((element) => element.ormawa != 'Admin')
    //               .toList();
    //           return Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "Organisasi Acara :",
    //                 style:
    //                     boldFontStyle.copyWith(fontSize: 16, color: blackColor),
    //               ),
    //               const SizedBox(
    //                 height: 12,
    //               ),
    //               Container(
    //                 height: 60,
    //                 padding:
    //                     const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
    //                 decoration: BoxDecoration(
    //                   border:
    //                       Border.all(width: 1, color: const Color(0xffe5e5e5)),
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //                 child: DropdownButton(
    //                   value: organizedBy,
    //                   isExpanded: true,
    //                   underline: const SizedBox(),
    //                   items: data.map((e) {
    //                     return DropdownMenuItem(
    //                       child: Text(e.ormawa!),
    //                       value: e.id,
    //                     );
    //                   }).toList(),
    //                   onChanged: (newValue) {
    //                     setState(() {
    //                       organizedBy = newValue.toString();
    //                     });
    //                   },
    //                 ),
    //               ),
    //             ],
    //           );
    //         }
    //         return const Center(child: CircularProgressIndicator());
    //       });
    // }

    Widget dateMeetings() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tanggal Agenda",
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
            "Waktu Agenda",
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
            "Lokasi Agenda",
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
                hintText: widget.eventModel!.location,
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

                String? response = await eventServices.updateEvent(
                    widget.eventModel!.id,
                    (titleController.text.isEmpty)
                        ? widget.eventModel!.title
                        : titleController.text,
                    (descriptionController.text.isEmpty)
                        ? widget.eventModel!.description
                        : descriptionController.text,
                    dateMeeting,
                    selectedTime,
                    (locationController.text.isEmpty)
                        ? widget.eventModel!.location
                        : locationController.text);
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
                    "Update agenda ${widget.eventModel!.categoryEvent}?\nSilahkan isi field dibawah ini",
                    style: boldFontStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  titleTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  descriptionTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  // organizedByTextField(),
                  // const SizedBox(
                  //   height: 20,
                  // ),
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
              )),
        ),
      ),
    );
  }
}
