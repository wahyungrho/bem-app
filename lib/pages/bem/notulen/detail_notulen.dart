part of '../../pages.dart';

class DetailNotulen extends StatelessWidget {
  final NotulenModel notulenModel;
  const DetailNotulen({Key? key, required this.notulenModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget detailItemTema(NotulenModel text) {
      return Row(
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
                  "Tema Pembahasan :",
                  style: mediumFontStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text.tema!,
                  style: boldFontStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget detailItemDateTime(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Tanggal dan Waktu :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.tglRapat! + ' | ' + text.time! + " WIB",
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

    Widget detailItemLocation(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Lokasi Rapat :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.lokasi!,
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

    Widget detailItemPimpinanRapat(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Pemimpin Rapat :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.pimpinanRapat!,
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

    Widget detailItemJumlahKehadiran(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Jumlah Kehadiran :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.jumlahKehadiran! + " Peserta",
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

    Widget detailItemRingkasanRapat(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Ringkasan Pembahasan :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.notulenContent!,
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

    Widget detailItemCreatedNotulen(NotulenModel text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
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
                    "Notulen dibuat Pada :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.createdNotulen!,
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

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Detail Notulen"),
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          detailItemTema(notulenModel),
          detailItemDateTime(notulenModel),
          detailItemLocation(notulenModel),
          detailItemPimpinanRapat(notulenModel),
          detailItemJumlahKehadiran(notulenModel),
          detailItemRingkasanRapat(notulenModel),
          detailItemCreatedNotulen(notulenModel),
        ],
      ),
    );
  }
}
