import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';


import 'package:snagging/presentation/widgets/loading_item.dart';
import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'download_helper_function.dart';

class WebViewScreen2 extends StatefulWidget {
  final String title;
  final String url;

  WebViewScreen2({required this.url, required this.title});

  @override
  State<WebViewScreen2> createState() => _WebViewScreen2State();
}

class _WebViewScreen2State extends State<WebViewScreen2> {
  int index = 0;
  double webProgress = 0;
  late InAppWebViewController controller;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Enable virtual display.
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  late PageController _pageController;

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  Future<bool> _checkPermission(platform) async {
    if (Platform.isIOS) return true;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (platform == TargetPlatform.android &&
        androidInfo.version.sdkInt <= 28) {
      final status = await Permission.storage.status;
      // final status2 = await Permission.manageExternalStorage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        // final result2 = await Permission.manageExternalStorage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Stack(
        children: [
          // WebView(
          //   navigationDelegate: (NavigationRequest request) {
          //     return NavigationDecision.navigate;
          //   },
          //   initialUrl: widget.url,
          //   javascriptMode: JavascriptMode.unrestricted,
          //   onWebViewCreated: (WebViewController controller) {
          //     _webViewController = controller;
          //   },
          //   onProgress: (progress) {
          //     setState(() {
          //       webProgress = progress / 100;
          //     });
          //   },
          // ),
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onWebViewCreated: (InAppWebViewController conr) {
              controller = conr;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                webProgress = progress / 100;
              });
            },

            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(useOnDownloadStart: true),
            ),
            // onDownloadStart: (controller, url,) async {
            //   print("onDownloadStart $url");
            //   final taskId = await FlutterDownloader.enqueue(
            //     url: Uri.parse("uri") as String,
            //     savedDir: (await getExternalStorageDirectory())!.path,
            //     showNotification: true, // show download progress in status bar (for Android)
            //     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
            //   );
            // },
            onDownloadStartRequest: (controller, DownloadStartRequest request) async {
              //todo download catelog here
              FlutterDownloader.registerCallback(downloadCallback);
              final platform = Theme.of(context).platform;
              bool value = await _checkPermission(platform);
              if(value){
                await prepareSaveDir();
                {
                  final taskId = await FlutterDownloader.enqueue(
                    url: request.url.toString().contains("report")?"http://snaggingmasters.ae/admin/reports/download-pdf/4":request.url.toString(),
                    savedDir: localPath,
                    headers: {

                    },
                    showNotification: true,
                    saveInPublicStorage: true,// show download progress in status bar (for Android)
                    openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                  );
                  FlutterDownloader.open(taskId: taskId!);
                }
              }
            },
          ),

          webProgress < 1 ? BuildLoadingWidget() : SizedBox(),
        ],
      ),
    );
  }
}
