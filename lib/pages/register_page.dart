part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  List<String>? listRole;
  String? selectedRole;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ukmOrmawaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listRole = ['BEM', 'UKM/Ormawa', 'MPM/DPM'];
    selectedRole = listRole![1];
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthServices>(context);
    Widget roleDropdown() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign up as :",
            style: mediumFontStyle.copyWith(fontSize: 16, color: blackColor),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                  value: selectedRole,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: listRole!
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style:
                                  mediumFontStyle.copyWith(color: greyColor))))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedRole = item.toString();
                    });
                  })),
        ],
      );
    }

    Widget fullnameTextField() {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: fullnameController,
          style: mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
          decoration: InputDecoration(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                width: 26,
                height: 26,
                child: Image.asset(
                  'assets/icon/Icon_person.png',
                  fit: BoxFit.cover,
                ),
              ),
              hintText: "Full name",
              hintStyle:
                  mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5)),
        ),
      );
    }

    Widget phoneTextField() {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: phoneController,
          style: mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
          decoration: InputDecoration(
              icon: Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: 26,
                  height: 26,
                  child: const Icon(
                    Icons.phone_iphone_rounded,
                    color: Color(0xffa6a7af),
                  )),
              hintText: "Phone",
              hintStyle:
                  mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5)),
        ),
      );
    }

    Widget emailTextField() {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: emailController,
          style: mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
          decoration: InputDecoration(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                width: 26,
                height: 26,
                child: Image.asset(
                  'assets/icon/Icon_mail.png',
                  fit: BoxFit.cover,
                ),
              ),
              hintText: "Email",
              hintStyle:
                  mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5)),
        ),
      );
    }

    Widget passwordTextField() {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: passwordController,
          obscureText: true,
          style: mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
          decoration: InputDecoration(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                width: 26,
                height: 26,
                child: Image.asset(
                  'assets/icon/Icon_lock.png',
                  fit: BoxFit.cover,
                ),
              ),
              hintText: "Password",
              hintStyle:
                  mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5)),
        ),
      );
    }

    Widget ormawaTextField() {
      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffe5e5e5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: ukmOrmawaController,
          style: mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
          decoration: InputDecoration(
              icon: Container(
                padding: const EdgeInsets.only(top: 5),
                width: 26,
                height: 26,
                child: Image.asset(
                  'assets/icon/Icon_organisasi.png',
                  fit: BoxFit.cover,
                ),
              ),
              hintText: "UKM or ormawa name",
              hintStyle:
                  mediumFontStyle.copyWith(fontSize: 18, color: greyColor),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 5)),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        height: 60,
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
                    phoneController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    ukmOrmawaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please complete the fields !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else if (!EmailValidator.validate(emailController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Sorry, the email is not valid !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else if (passwordController.text.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text("Sorry, the password is at least 8 characters !"),
                    backgroundColor: Color(0xffFF5677),
                  ));
                } else {
                  UserModel? userModel = await authProvider.signup(
                      selectedRole,
                      fullnameController.text,
                      phoneController.text,
                      emailController.text,
                      passwordController.text,
                      ukmOrmawaController.text);

                  if (userModel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Sorry, the account is already registered !"),
                      backgroundColor: Color(0xffFF5677),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Yeay, account registration successful! Please login with your account...",
                        style: boldFontStyle.copyWith(color: whiteColor),
                      ),
                      backgroundColor: const Color(0xff7CD1B8),
                      duration: const Duration(milliseconds: 1500),
                    ));
                    Timer(const Duration(milliseconds: 2500), () {
                      Get.to(const LoginPage());
                    });
                  }
                }
                setState(() {});
              });
            },
            child: (isLoading == false)
                ? Text(
                    "Register",
                    style: boldFontStyle.copyWith(fontSize: 18),
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
                  height: 50,
                ),
                Text(
                  "Welcome!\nPlease sign up now",
                  style: boldFontStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                roleDropdown(),
                const SizedBox(
                  height: 40,
                ),
                fullnameTextField(),
                const SizedBox(
                  height: 20,
                ),
                phoneTextField(),
                const SizedBox(
                  height: 20,
                ),
                emailTextField(),
                const SizedBox(
                  height: 20,
                ),
                passwordTextField(),
                const SizedBox(
                  height: 20,
                ),
                ormawaTextField(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                buttonLogin(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account ? ",
                        style: mediumFontStyle.copyWith(
                            fontSize: 16, color: blackColor)),
                    const SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const LoginPage());
                      },
                      child: Text("Login now",
                          style: regulerFontStyle.copyWith(
                              fontSize: 16, color: mainColor)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
