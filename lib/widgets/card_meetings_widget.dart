part of 'widgets.dart';

class MeetingCardWidget extends StatelessWidget {
  final MeetingModel? meetingModel;
  const MeetingCardWidget({this.meetingModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          top: 16,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: greySecondaryColor),
            borderRadius: BorderRadius.circular(8),
            color: greySecondaryColor.withOpacity(0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meetingModel!.tema!,
              style: boldFontStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              meetingModel!.subtema!,
              style: regulerFontStyle,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    DateFormat('E')
                            .format(DateTime.parse(meetingModel!.date!)) +
                        ', ${meetingModel!.date}\n' +
                        meetingModel!.time!,
                    style: regulerFontStyle.copyWith(color: greyColor),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    meetingModel!.location!,
                    style: boldFontStyle.copyWith(color: greyColor),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
