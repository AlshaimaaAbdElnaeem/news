import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.url});
final String url;
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
WebViewController ? controller;
@override
  void initState() {
    super.initState();
    controller =WebViewController();
    Uri uri = Uri.parse(widget.url);
    controller!.loadRequest(uri);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WebViewWidget(controller:controller! ,),
    );
  }
}