import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovenfield_mobile/common/common.dart';
import 'package:ovenfield_mobile/common/define_field.dart';
import 'package:ovenfield_mobile/common/define_service_api.dart';
import 'package:ovenfield_mobile/data/service/update_version_service/check_update_version_app_service.dart';
import 'package:ovenfield_mobile/data/shared_preferences/shared_preferences.dart';
import 'package:ovenfield_mobile/shared_code/dialog_manager/data_models/dialog_response.dart';
import 'package:ovenfield_mobile/shared_code/dialog_manager/data_models/type_dialog.dart';
import 'package:ovenfield_mobile/shared_code/dialog_manager/locator.dart';
import 'package:ovenfield_mobile/shared_code/dialog_manager/services/dialog_service.dart';
import 'package:ovenfield_mobile/shared_code/model/version_model/version_model.dart';
import 'package:ovenfield_mobile/shared_code/utils/materials/constant.dart';
import 'package:ovenfield_mobile/shared_code/widgets/dialog_download_new_version.dart';
import 'package:ovenfield_mobile/shared_code/widgets/dialog_internet_connection.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ovenfield_mobile/shared_code/utils/methods/common_method.dart';

import 'notification_center.dart';

class PageContainer extends StatefulWidget {
  const PageContainer({
    this.bloc,
    this.di,
    this.child,
  });

  final Widget child;

  final List<SingleChildWidget> bloc;
  final List<SingleChildWidget> di;

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  bool _isDialogNetWorkShowing = false;
  bool _isDialogVersionShowing = false;
  PublishSubject notificationSignal = PublishSubject<dynamic>();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final DialogService _dialogService = locator<DialogService>();
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    _listenNotificationCenter();

    _initConnectivity();

    // Init Listener for checking Network
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    // Check Version
    _checkVersionApp();
  }

  @override
  void dispose() {
    super.dispose();
    notificationSignal.close();
    if (_connectivitySubscription != null) {
      _connectivitySubscription.cancel();
    }
  }

  Future<void> _initConnectivity() async {
    var result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        if (_isDialogNetWorkShowing) {
          _isDialogNetWorkShowing = false;
          Navigator.pop(context);
        }
        break;
      case ConnectivityResult.none:
        _isDialogNetWorkShowing = true;
        await showDialogInternetConnect(context, result);
        break;
      default:
        break;
    }
  }

  void _listenNotificationCenter() {
    NotificationCenter.share.notificationPublishSubject.stream.listen((value) {
      notificationSignal.add(value);
    });

    notificationSignal = PublishSubject<dynamic>();

    notificationSignal.stream.listen((value) {
      if (isDialogNotificationShowing) {
        return;
      }

      isDialogNotificationShowing = true;
      _showDialogNotification(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...widget.di,
        ...widget.bloc,
      ],
      child: widget.child,
    );
  }

  Future<void> showDialogInternetConnect(
      BuildContext context, ConnectivityResult result) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return DialogInternetConnect(
            onPressed: () {
              if (!_isDialogNetWorkShowing) {
                Navigator.of(context).pop('dialog');
              }
            },
          );
        });
  }

  Future<void> _checkVersionApp() async {
    final versionInfo = await _checkDownloadNewVersionApp();
    if (versionInfo == null) {
      // Hide popup
      if (_isDialogVersionShowing) {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _isDialogVersionShowing = false;
      }
    } else {
      // Has shown popup???
      if (_isDialogVersionShowing) {
        return;
      }

      // Show popup
      await _showDialogDownloadNewVersion(tr('AppUpdateMessage'), versionInfo);
    }
  }

  Future<void> _showDialogDownloadNewVersion(
      String content, VersionModel versionInfo) async {
    final dialogResult = await _dialogService.showDialog(
      title: tr('Info'),
      description: content,
      typeDialog: DIALOG_ONE_BUTTON,
      titleButton: tr('ok'),
    );

    if (dialogResult.confirmed) {
      _isDialogVersionShowing = false;
      // Show Download New Version
      await _showDownloadDialog(versionInfo);
    } else {
      _isDialogVersionShowing = false;
    }
  }

  Future<void> _showDownloadDialog(VersionModel versionInfo) async {
    final alertDialog = DownloadNewVersionDialog(
        apkLink: versionInfo.apkLink, name: versionInfo.versionName);
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Future<VersionModel> _checkDownloadNewVersionApp() async {
    // Get value Version
    final versionCode = await SPref.instance.get(SPrefCache.PROJECT_CODE);
    final environment = ovMediaApiEnvironment;
    if (environment == DEV_ENVIRONMENT) {
      return null;
    }

    // Request API
    final checkDownloadNewVersionService = CheckUpdateVersionAppService();
    final response = await checkDownloadNewVersionService.checkUpdateVersionApp(
      int.parse(versionCode),
      environment,
    );

    final hasUpdateVersion = response.data[ALLOW_UPDATE_FIELD];
    if (hasUpdateVersion) {
      final versionInfo = VersionModel.fromJson(response.data[DATA_FIELD]);
      return versionInfo;
    }
    return null;
  }

  Future<void> _showDialogNotification(String content) async {
    final dialogResult = await _dialogService.showDialog(
      title: tr('Notification'),
      description: content,
      typeDialog: DIALOG_TWO_BUTTON,
    );

    if (dialogResult.confirmed) {
      isDialogNotificationShowing = false;
    } else {
      isDialogNotificationShowing = false;
    }
  }
}

class NavigatorProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
