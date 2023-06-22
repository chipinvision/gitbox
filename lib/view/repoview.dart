import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:gitbox/utils/appcolors.dart';

class RepoView extends StatefulWidget {
  final dynamic url;
  const RepoView({super.key, this.url});

  @override
  State<RepoView> createState() => _RepoViewState();
}

class _RepoViewState extends State<RepoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.bgColor,
        elevation: 0.0,
      ),
      body: WebView(
        backgroundColor: AppColors.bgColor,
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}