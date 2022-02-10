part of '../../pages.dart';

class UpdateUser extends StatefulWidget {
  final UserModel? userModel;
  final VoidCallback? method;
  const UpdateUser({this.method, this.userModel, Key? key}) : super(key: key);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  bool? isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userServices = Provider.of<UserServices>(context);
    Widget resetPasswordTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reset Password*",
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
              controller: passwordController,
              obscureText: true,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: mediumFontStyle.copyWith(color: greyColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }

    Widget resetStatusTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reset Status*",
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
              controller: statusController,
              style: mediumFontStyle.copyWith(color: greyColor),
              decoration: InputDecoration(
                hintText: 'Aktif/Tidak Aktif',
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
                if (statusController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please complete the fields !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else {
                  String? response = await userServices.updateUser(
                      widget.userModel!.id,
                      passwordController.text,
                      statusController.text);
                  if (response == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Oops, update data failed! please try again ..."),
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
                      Get.back();
                      Get.back();
                      widget.method!();
                    });
                  }
                }
                setState(() {});
              });
            },
            child: (isLoading == false)
                ? Text(
                    "Reset Data",
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
                "Reset data pengguna?\nSilahkan isi field dibawah ini",
                style: boldFontStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              resetPasswordTextField(),
              const SizedBox(
                height: 20,
              ),
              resetStatusTextField(),
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
