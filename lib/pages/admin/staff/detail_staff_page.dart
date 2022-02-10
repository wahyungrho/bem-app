part of '../../pages.dart';

class DetailStaffPage extends StatefulWidget {
  final StaffModel? staffModel;
  final VoidCallback method;
  const DetailStaffPage(this.method, {this.staffModel, Key? key})
      : super(key: key);

  @override
  State<DetailStaffPage> createState() => _DetailStaffPageState();
}

class _DetailStaffPageState extends State<DetailStaffPage> {
  bool isLoading = false;
  _showDialogDelete(Function? function) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Informasi !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu yakin untuk menghapus data tersebut ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateColor.resolveWith((states) => whiteColor),
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => mainColor)),
                child: const Text('Tidak'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xffFF5677)),
                    side: MaterialStateProperty.resolveWith((states) =>
                        const BorderSide(width: 1, color: Color(0xffFF5677)))),
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
    Widget detailItemName(StaffModel text) {
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
                    "Nama Lengkap :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.name!,
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

    Widget detailItemEmail(StaffModel text) {
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
                    "Alamat Email :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.email!,
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

    Widget detailItemPeriod(StaffModel text) {
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
                    "Periode Jabatan :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.periode!,
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

    Widget detailItemPosition(StaffModel text) {
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
                    "Jabatan Keanggotaan :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.position!,
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
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(UpdateStaff(
                        method: widget.method,
                        staffModel: widget.staffModel,
                      ));
                    },
                    child: Text(
                      "Edit",
                      style: boldFontStyle,
                    )),
              ),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(width: 1, color: const Color(0xffFF5677))),
                child: ElevatedButton(
                    onPressed: () {
                      _showDialogDelete(() {
                        setState(() {
                          isLoading = true;
                        });

                        Timer(const Duration(milliseconds: 3000), () async {
                          isLoading = false;

                          String? response = await staffServices
                              .deleteStaff(widget.staffModel!.id);
                          if (response == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Oops, remove data failed! please try again ..."),
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
                              Get.back();
                              widget.method();
                            });
                          }

                          setState(() {});
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: const Color(0xffFF5677)),
                    child: (isLoading == false)
                        ? Text(
                            "Hapus",
                            style: boldFontStyle,
                          )
                        : const CircularProgressIndicator(
                            color: Color(0xffFF5677),
                          )),
              ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          backgroundColor: mainColor, title: const Text("Detail Member")),
      body: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            detailItemName(widget.staffModel!),
            const SizedBox(
              height: 14,
            ),
            detailItemEmail(widget.staffModel!),
            const SizedBox(
              height: 14,
            ),
            detailItemPeriod(widget.staffModel!),
            const SizedBox(
              height: 14,
            ),
            detailItemPosition(widget.staffModel!),
            const SizedBox(
              height: 40,
            ),
            buttonAction(),
          ],
        ),
      ),
    );
  }
}
