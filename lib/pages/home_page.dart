part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget columnMisi(String text) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\u2022',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.45,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: regulerFontStyle.copyWith(
                      fontSize: 16, color: greyColor, height: 1.5),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Tentang BEM",
                style: boldFontStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Badan Eksekutif Mahasiswa (BEM) Universitas Trilogi adalah wadah atau badan normatif yang menaungi dan mengkordinir pelaksanaan kegiatan ekstra kurikuler mahasiswa di Universitas Trilogi.",
                style: regulerFontStyle.copyWith(
                    fontSize: 16, color: greyColor, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Visi BEM",
                style: boldFontStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Menjadikan BEM sebagai lembaga yang terintegrasi dan berempati dengan berasas kekeluargaan.",
                style: regulerFontStyle.copyWith(
                    fontSize: 16, color: greyColor, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Misi BEM",
                style: boldFontStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              const SizedBox(
                height: 14,
              ),
              columnMisi(
                  "Membangun relasi yang terstruktur demi terciptanya koordinasi yang baik."),
              const SizedBox(
                height: 8,
              ),
              columnMisi(
                  "Mengembangkan dan menerapkan fungsi BEM sebagai lembaga yang fleksibel dan efisien."),
              const SizedBox(
                height: 8,
              ),
              columnMisi("Menjadikan BEM sebagai wadah aspirasi yang solutif."),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Struktur BEM Trilogi",
                style: boldFontStyle.copyWith(fontSize: 18, color: blackColor),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: greySecondaryColor),
                    color: const Color(0xfffcfcfd),
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(
                  'assets/img/struktur_bem.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.5, color: greySecondaryColor),
                        color: const Color(0xfffcfcfd),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: mainColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Email",
                              style: boldFontStyle.copyWith(
                                  fontSize: 16, color: mainColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "bemtrilogi@gmail.com",
                          style: mediumFontStyle,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Line: @172htmry",
                          style: mediumFontStyle,
                        ),
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.5, color: greySecondaryColor),
                        color: const Color(0xfffcfcfd),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: mainColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Operasional",
                              style: boldFontStyle.copyWith(
                                  fontSize: 16, color: mainColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Senin - Jumat",
                          style: mediumFontStyle,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "09:00 - 17:00 WIB",
                          style: mediumFontStyle,
                        ),
                      ],
                    )),
              ]),
              const SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }
}
