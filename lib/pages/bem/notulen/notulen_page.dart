part of '../../pages.dart';

class NotulenPage extends StatefulWidget {
  const NotulenPage({Key? key}) : super(key: key);

  @override
  State<NotulenPage> createState() => _NotulenPageState();
}

class _NotulenPageState extends State<NotulenPage> {
  bool? isLoadingPage = false;
  List<NotulenModel> list = [];

  Future<void> getNotulen() async {
    list.clear();
    setState(() {
      isLoadingPage = true;
    });
    var response = await http.get(Uri.parse(BASEURL.fetchNotulen));
    var data = jsonDecode(response.body);

    for (var item in data) {
      list.add(NotulenModel.fromJson(item));
      setState(() {});
    }

    if (kDebugMode) {
      print(list);
    }
  }

  @override
  void initState() {
    super.initState();
    getNotulen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(defaultMargin - 4),
            child: Text(
              "Notulen Rapat",
              style: boldFontStyle.copyWith(fontSize: 18, color: blackColor),
            ),
          ),
          const Divider(height: 0, color: Colors.grey),
          for (var i = 0; i < list.length; i++)
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(DetailNotulen(notulenModel: list[i]));
                  },
                  title: Text(list[i].tema!),
                  subtitle: Text(list[i].subtema!),
                  trailing: Text(
                    DateFormat('E').format(DateTime.parse(list[i].tglRapat!)) +
                        ', ${list[i].tglRapat!}\n' +
                        list[i].time! +
                        " WIB",
                    style: regulerFontStyle.copyWith(color: greyColor),
                  ),
                ),
                const Divider(height: 0, color: Colors.grey)
              ],
            )
        ],
      ),
    );
  }
}
