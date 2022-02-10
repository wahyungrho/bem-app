part of '../../pages.dart';

class WebViewProposal extends StatefulWidget {
  final String? pathProposal;
  const WebViewProposal({this.pathProposal, Key? key}) : super(key: key);

  @override
  _WebViewProposalState createState() => _WebViewProposalState();
}

class _WebViewProposalState extends State<WebViewProposal> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: BASEURL.apiViewProposal + widget.pathProposal!,
    );
  }
}
