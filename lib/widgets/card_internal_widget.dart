part of 'widgets.dart';

class InternalEventWidget extends StatelessWidget {
  final EventModel? eventModel;
  const InternalEventWidget({this.eventModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: greySecondaryColor),
            borderRadius: BorderRadius.circular(8),
            color: greySecondaryColor.withOpacity(0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    eventModel!.title!,
                    style: boldFontStyle.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    DateFormat('E').format(DateTime.parse(eventModel!.date!)) +
                        ', ${eventModel!.date}\n' +
                        eventModel!.time!,
                    style: mediumFontStyle.copyWith(color: greyColor),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: regulerFontStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Organized By : ",
                      style: boldFontStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${eventModel!.organizedBy}",
                      style: regulerFontStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: regulerFontStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lokasi : ",
                      style: boldFontStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${eventModel!.location}",
                      style: regulerFontStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2022",
                  style: regulerFontStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status : ",
                      style: boldFontStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${eventModel!.status}",
                      style: regulerFontStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
