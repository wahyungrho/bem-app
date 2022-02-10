part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String>? listRole;
  String? selectedRole;
  bool? isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listRole = ['Admin', 'BEM', 'UKM/Ormawa', 'MPM/DPM'];
    selectedRole = listRole![2];
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthServices>(context);
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

    Widget roleDropdown() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign in as :",
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
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
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
                  UserModel? userModel = await authProvider.signin(selectedRole,
                      emailController.text, passwordController.text);

                  if (userModel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Oops, sign in failed! please try again ..."),
                      backgroundColor: Color(0xffFF5677),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Yeay, sign in success! enjoy your today ...",
                        style: boldFontStyle.copyWith(color: whiteColor),
                      ),
                      backgroundColor: const Color(0xff7CD1B8),
                      duration: const Duration(milliseconds: 1500),
                    ));
                    Timer(const Duration(milliseconds: 2500), () {
                      Get.to(const MainPage());
                    });
                  }
                }
                setState(() {});
              });
            },
            child: (isLoading == false)
                ? Text(
                    "Login",
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
                  "Welcome!\nLet’s sign in now",
                  style: boldFontStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                roleDropdown(),
                const SizedBox(
                  height: 40,
                ),
                emailTextField(),
                const SizedBox(
                  height: 20,
                ),
                passwordTextField(),
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
                    Text("Don't have an account?",
                        style: mediumFontStyle.copyWith(
                            fontSize: 16, color: blackColor)),
                    const SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const RegisterPage());
                      },
                      child: Text("Register now",
                          style: regulerFontStyle.copyWith(
                              fontSize: 16, color: mainColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
