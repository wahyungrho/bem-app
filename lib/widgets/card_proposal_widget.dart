part of 'widgets.dart';

class CardProposalWidget extends StatefulWidget {
  final ProposalModel? proposalModel;
  const CardProposalWidget({this.proposalModel, Key? key}) : super(key: key);

  @override
  State<CardProposalWidget> createState() => _CardProposalWidgetState();
}

class _CardProposalWidgetState extends State<CardProposalWidget> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.proposalModel!.tema!,
                  style: boldFontStyle.copyWith(fontSize: 16),
                ),
                const Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.proposalModel!.nameOrmawa!,
              style: regulerFontStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              (widget.proposalModel!.pathFile! == '-')
                  ? "Status proposal : Proposal belum diupload"
                  : "Status proposal : " +
                      widget.proposalModel!.statusProposal!,
              style: regulerFontStyle,
            ),
          ],
        ));
  }
}
