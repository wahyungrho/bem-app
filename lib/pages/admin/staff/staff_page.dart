part of '../../pages.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  TextEditingController searchController = TextEditingController();
  int? sortColumnIndex;
  bool isAscending = false;
  List<StaffModel> listStaff = [];
  List<StaffModel> listSearchStaff = [];
  StaffServices staffServices = StaffServices();

  getListStaff() async {
    listStaff = await staffServices.fetchStaff();
    setState(() {});
  }

  void searchStaff(String text) {
    listSearchStaff.clear();
    if (text.isEmpty) {
      setState(() {});
    } else {
      for (var element in listStaff) {
        if (element.name!.toLowerCase().contains(text)) {
          listSearchStaff.add(element);
        }
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListStaff();
  }

  @override
  Widget build(BuildContext context) {
    var staffServices = Provider.of<StaffServices>(context);
    return FutureBuilder(
        future: staffServices.fetchStaff(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daftar Anggota",
                        style: boldFontStyle.copyWith(
                            fontSize: 18, color: blackColor),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: mainColor),
                          onPressed: () {
                            Get.to(AddStaff(getListStaff));
                          },
                          child: const Text("Tambah data")),
                    ],
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
                      onChanged: searchStaff,
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
                          hintText: "Cari Anggota ...",
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
    final columns = ['Name', 'Jabatan', 'Periode', 'Aksi'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        horizontalMargin: 0,
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: getColumns(columns),
        rows:
            getRow(searchController.text.isEmpty ? listStaff : listSearchStaff),
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

  List<DataRow> getRow(List<StaffModel> staffModel) => staffModel.map((e) {
        final cells = [e.name, e.position, e.periode, "Detail"];
        return DataRow(cells: getCells(cells, e));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, StaffModel? staffModel) => cells
      .map((e) => DataCell((e == "Detail")
          ? ElevatedButton(
              onPressed: () {
                Get.to(DetailStaffPage(
                  getListStaff,
                  staffModel: staffModel!,
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
      listStaff.sort((a, b) => compareString(ascending, a.name!, b.name!));
    } else if (columnIndex == 1) {
      listStaff
          .sort((a, b) => compareString(ascending, a.position!, b.position!));
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
