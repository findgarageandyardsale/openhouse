import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:open_house/shared/domain/circulat_indicator_widget.dart';
import 'package:open_house/shared/widgets/custom_percent_indicator.dart';

@RoutePage()
class WebviewWidgetScreen extends StatefulWidget {
  final String title, type, data;

  const WebviewWidgetScreen({
    super.key,
    this.title = 'Document Files',
    this.type = 'url',
    required this.data,
  });

  @override
  State<WebviewWidgetScreen> createState() => _WebviewWidgetScreenState();
}

class _WebviewWidgetScreenState extends State<WebviewWidgetScreen> {
  bool _isloading = false;
  final GlobalKey webViewKey = GlobalKey();

  // Android WebView doesn't natively render PDFs; wrap in Google Docs viewer.
  // iOS WKWebView renders PDFs natively.
  String _effectiveUrl(String url) {
    if (url.contains('.pdf') && Platform.isAndroid) {
      return 'https://docs.google.com/gview?embedded=true&url=${Uri.encodeComponent(url)}';
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ModalProgressHUD(
        inAsyncCall: false,
        child:
            widget.type == 'file'
                ? Image.file(
                  File(widget.data),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                )
                : widget.data.contains('.xlsx')
                ? const Center(child: Text('Cannot Preview this file'))
                : Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      onLoadStart: (controller, url) {
                        setState(() {
                          _isloading = true;
                        });
                      },
                      onLoadStop: (controller, url) {
                        setState(() {
                          _isloading = false;
                        });
                      },
                      initialSettings: InAppWebViewSettings(),
                      initialUrlRequest: URLRequest(
                        url: WebUri.uri(Uri.parse(_effectiveUrl(widget.data))),
                      ),
                    ),
                    // Circular loading indicator
                    if (_isloading) const CircularIndicatorWidget(),
                  ],
                ),
      ),
    );
  }
}
