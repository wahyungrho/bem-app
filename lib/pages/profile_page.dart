part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  _showDialogLogout() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Informasi !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu yakin untuk keluar ?'),
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
                  Get.back();
                  setState(() {
                    isLoading = true;
                  });

                  Timer(const Duration(milliseconds: 3000), () async {
                    isLoading = false;
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();

                    sharedPreferences.remove(UserPrefProfile.idUser);
                    sharedPreferences.remove(UserPrefProfile.idRole);
                    sharedPreferences.remove(UserPrefProfile.fullname);
                    sharedPreferences.remove(UserPrefProfile.email);
                    sharedPreferences.remove(UserPrefProfile.phone);
                    sharedPreferences.remove(UserPrefProfile.createddatetime);
                    sharedPreferences.remove(UserPrefProfile.isLogin);

                    setState(() {
                      Get.off(const LoginPage());
                    });
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var authServices = Provider.of<AuthServices>(context);
    Widget detailItemOrmawa(UserModel text) {
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
                    "Ukm/Organisasi :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.ormawa!,
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

    Widget detailItemEmail(UserModel text) {
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

    Widget detailItemPhone(UserModel text) {
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
                    "No Telepon :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.telp!,
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

    Widget detailItemCreatedDate(UserModel text) {
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
                    "Bergabung pada :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.createddatetime!,
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

    Widget buttonLogout() {
      return Container(
          margin: const EdgeInsets.only(
            top: 50,
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  _showDialogLogout();
                },
                child: (isLoading == false)
                    ? Text(
                        "Logout",
                        style: boldFontStyle,
                      )
                    : CircularProgressIndicator(
                        color: whiteColor,
                      )),
          ));
    }

    return Scaffold(
        body: FutureBuilder<List<UserModel>>(
            future: authServices.fetchUserProfile(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data!
                        .map(
                          (e) => Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                        mainColor,
                                        Colors.blue[300]!,
                                      ])),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 150.0,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(e.fullname!,
                                              style: mediumFontStyle.copyWith(
                                                  color: whiteColor,
                                                  fontSize: 22)),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(e.idRole!,
                                              style: mediumFontStyle.copyWith(
                                                  color: whiteColor,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(defaultMargin),
                                  child: Column(children: [
                                    detailItemOrmawa(e),
                                    detailItemEmail(e),
                                    detailItemPhone(e),
                                    detailItemCreatedDate(e),
                                    buttonLogout(),
                                  ])),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(color: mainColor));
              }
            }));
  }
}
