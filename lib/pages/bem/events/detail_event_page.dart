part of '../../pages.dart';

class DetailEventPage extends StatefulWidget {
  final EventModel? eventModel;
  final VoidCallback method;
  final String? roleID;
  const DetailEventPage(this.method, {this.eventModel, this.roleID, Key? key})
      : super(key: key);

  @override
  _DetailEventPageState createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  bool isLoading = false;
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
  Widget build(BuildContext context) {
    var eventServices = Provider.of<EventServices>(context);
    Widget detailItemTitle(EventModel text) {
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
                    "Nama Acara :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.title!,
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

    Widget detailItemDescription(EventModel text) {
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
                    "Deskripsi Acara :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.description!,
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

    Widget detailItemDate(EventModel text) {
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
                    "Waktu Pelaksanaan :",
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

    Widget detailItemLocation(EventModel text) {
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
                    "Lokasi Acara :",
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

    Widget detailItemOrganizedBy(EventModel text) {
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
                    "Acara Organisasi :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.organizedBy!,
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
          child: Column(
            children: [
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(UpdateEvent(
                        widget.method,
                        eventModel: widget.eventModel,
                      ));
                    },
                    child: Text(
                      "Edit",
                      style: boldFontStyle,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber, onPrimary: blackColor),
                    onPressed: () {
                      _showDialogUsulan(() {
                        setState(() {
                          isLoading = true;
                        });
                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading = false;
                          String? response = await eventServices
                              .updateEventClose(widget.eventModel!.id);
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
                              widget.method();
                              Get.back();
                              setState(() {});
                            });
                          }
                          setState(() {});
                        });
                      }, 'Apakah agenda ini sudah selesai ?');
                    },
                    child: (isLoading == false)
                        ? Text(
                            "Selesai",
                            style: boldFontStyle,
                          )
                        : CircularProgressIndicator(
                            color: blackColor,
                          )),
              ),
              // Container(
              //   height: 45,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       border:
              //           Border.all(width: 1, color: const Color(0xffFF5677))),
              //   child: ElevatedButton(
              //       onPressed: () {
              //         // _showDialogDelete(() {
              //         setState(() {
              //           isLoading = true;
              //         });

              //         Timer(const Duration(milliseconds: 3000), () async {
              //           isLoading = false;

              //           //     String? response = await staffServices
              //           //         .deleteStaff(widget.staffModel!.id);
              //           //     if (response == null) {
              //           //       ScaffoldMessenger.of(context)
              //           //           .showSnackBar(const SnackBar(
              //           //         content: Text(
              //           //             "Oops, remove data failed! please try again ..."),
              //           //         backgroundColor: Color(0xffFF5677),
              //           //       ));
              //           //     } else {
              //           //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           //         content: Text(
              //           //           response,
              //           //           style:
              //           //               boldFontStyle.copyWith(color: whiteColor),
              //           //         ),
              //           //         backgroundColor: const Color(0xff7CD1B8),
              //           //         duration: const Duration(milliseconds: 1500),
              //           //       ));
              //           //       Timer(const Duration(milliseconds: 2500), () {
              //           //         Get.back();
              //           //         widget.method();
              //           //       });
              //           //     }

              //           setState(() {});
              //         });
              //         // });
              //       },
              //       style: ElevatedButton.styleFrom(
              //           primary: Colors.white,
              //           onPrimary: const Color(0xffFF5677)),
              //       child: (isLoading == false)
              //           ? Text(
              //               "Hapus",
              //               style: boldFontStyle,
              //             )
              //           : const CircularProgressIndicator(
              //               color: Color(0xffFF5677),
              //             )),
              // ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Detail Acara"),
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          detailItemTitle(widget.eventModel!),
          const SizedBox(
            height: 14,
          ),
          detailItemDescription(widget.eventModel!),
          const SizedBox(
            height: 14,
          ),
          detailItemDate(widget.eventModel!),
          const SizedBox(
            height: 14,
          ),
          detailItemLocation(widget.eventModel!),
          const SizedBox(
            height: 14,
          ),
          detailItemOrganizedBy(widget.eventModel!),
          const SizedBox(
            height: 40,
          ),
          (widget.eventModel!.status == 'Aktif' && widget.roleID == '1')
              ? buttonAction()
              : const SizedBox(),
        ],
      ),
    );
  }
}
