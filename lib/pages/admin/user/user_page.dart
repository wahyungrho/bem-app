part of '../../pages.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController searchController = TextEditingController();
  int? sortColumnIndex;
  bool isAscending = false;
  List<UserModel> listUser = [];
  List<UserModel> listSearchUser = [];
  UserServices userServices = UserServices();

  getListUser() async {
    listUser = await userServices.fetchUser();
    setState(() {});
  }

  void searchUser(String text) {
    listSearchUser.clear();
    if (text.isEmpty) {
      setState(() {});
    } else {
      for (var element in listUser) {
        if (element.fullname!.toLowerCase().contains(text)) {
          listSearchUser.add(element);
        }
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListUser();
  }

  @override
  Widget build(BuildContext context) {
    var userServices = Provider.of<UserServices>(context);
    return FutureBuilder(
        future: userServices.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Daftar Pengguna",
                    style:
                        boldFontStyle.copyWith(fontSize: 18, color: blackColor),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xffe5e5e5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      onChanged: searchUser,
                      controller: searchController,
                      style: boldFontStyle.copyWith(
                          color: greyColor, fontSize: 14),
                      decoration: InputDecoration(
                          icon: const SizedBox(
                              width: 26,
                              height: 26,
                              child: Icon(
                                Icons.search,
                                color: Color(0xffa6a7af),
                              )),
                          hintText: "Cari pengguna ...",
                          hintStyle: mediumFontStyle.copyWith(
                              color: greyColor, fontSize: 14),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(bottom: 12)),
                    ),
                  ),
                  Container(
                    child: buildDataTable(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
          } else {
            return Center(child: CircularProgressIndicator(color: mainColor));
          }
        });
  }

  Widget buildDataTable() {
    final columns = ['Nama Lengkap', 'Email', 'Organisasi', 'Aksi'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        horizontalMargin: 0,
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: getColumns(columns),
        rows: getRow(searchController.text.isEmpty ? listUser : listSearchUser),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((e) => DataColumn(
            label: Text(
              e,
              style: boldFontStyle,
            ),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRow(List<UserModel> userModel) => userModel.map((e) {
        final cells = [e.fullname, e.email, e.ormawa, "Detail"];
        return DataRow(cells: getCells(cells, e));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, UserModel? userModel) => cells
      .map((e) => DataCell((e == "Detail")
          ? ElevatedButton(
              onPressed: () {
                Get.to(DetailUserPage(
                  getListUser,
                  userModel: userModel!,
                ));
              },
              child: const Text("Detail"),
              style: ElevatedButton.styleFrom(primary: mainColor),
            )
          : SizedBox(
              width: 100,
              child: Text(
                e.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: regulerFontStyle,
              ),
            )))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      listUser.sort((a, b) => compareString(ascending, "a.name!", "b.name!"));
    } else if (columnIndex == 1) {
      listUser.sort(
          (a, b) => compareString(ascending, "a.position!", "b.position!"));
    }

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) {
    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }
}
