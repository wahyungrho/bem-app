part of '../../pages.dart';

class DetailMeetingPage extends StatelessWidget {
  final MeetingModel? meetingModel;
  final VoidCallback? method;
  final String? roleID;
  const DetailMeetingPage(
      {this.method, this.meetingModel, this.roleID, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget detailItemTema(MeetingModel text) {
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
        ),
      );
    }

    Widget detailItemSubTema(MeetingModel text) {
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
                    "Sub Tema Pembahasan :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.subtema!,
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

    Widget detailItemDateTime(MeetingModel text) {
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
                    "Tanggal dan Waktu :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.date! + ' | ' + text.time!,
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

    Widget detailItemLocation(MeetingModel text) {
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
                    "Lokasi Rapat :",
                    style: mediumFontStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    text.location!,
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

    Widget buttonAction() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          child: SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(UpdateMeeting(
                    method!,
                    meetingModel: meetingModel,
                  ));
                },
                child: Text(
                  "Edit",
                  style: boldFontStyle,
                )),
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Detail Rapat"),
      ),
      body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              detailItemTema(meetingModel!),
              const SizedBox(
                height: 14,
              ),
              detailItemSubTema(meetingModel!),
              const SizedBox(
                height: 14,
              ),
              detailItemDateTime(meetingModel!),
              const SizedBox(
                height: 14,
              ),
              detailItemLocation(meetingModel!),
              const SizedBox(
                height: 40,
              ),
              (roleID == '1')
                  ? (meetingModel!.status != 'Selesai')
                      ? Column(
                          children: [
                            buttonAction(),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Get.to(FormMeetingEndPage(
                                      meetingModel: meetingModel!,
                                    ));
                                  },
                                  child: Text(
                                    "Rapat Selesai",
                                    style: mediumFontStyle,
                                  )),
                            )
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
            ],
          )),
    );
  }
}
