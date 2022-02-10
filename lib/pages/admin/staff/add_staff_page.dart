part of '../../pages.dart';

class AddStaff extends StatefulWidget {
  final VoidCallback method;
  const AddStaff(this.method, {Key? key}) : super(key: key);

  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  bool isLoading = false;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var staffServices = Provider.of<StaffServices>(context);
    Widget fullnameTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Lengkap",
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
              controller: fullnameController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Nama lengkap",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget emailTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Anggota",
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
              controller: emailController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Email anggota",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget periodeTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Periode Jabatan",
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
              controller: periodController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Contoh: 2021-2022",
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget positionTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jabatan Anggota",
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
              controller: positionController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: "Jabatan",
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
                if (fullnameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    periodController.text.isEmpty ||
                    positionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please complete the fields !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else if (!EmailValidator.validate(emailController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Sorry, the email is not valid !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else {
                  String? response = await staffServices.addStaff(
                      fullnameController.text,
                      emailController.text,
                      periodController.text,
                      positionController.text);
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
                    });
                  }
                }
                setState(() {});
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
                "Tambahkan anggota?\nSilahkan isi field dibawah ini",
                style: boldFontStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              fullnameTextField(),
              const SizedBox(
                height: 20,
              ),
              emailTextField(),
              const SizedBox(
                height: 20,
              ),
              periodeTextField(),
              const SizedBox(
                height: 20,
              ),
              positionTextField(),
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
